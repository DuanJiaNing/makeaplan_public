import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/statistics.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/preference/preference_manager.dart';
import 'package:makeaplan/manager/preference/selected_plan.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/phase_service.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/service/task_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/create_phase.dart';
import 'package:makeaplan/ui/pages/create_plan.dart';
import 'package:makeaplan/ui/pages/create_task.dart';
import 'package:makeaplan/ui/pages/main/common.dart';
import 'package:makeaplan/ui/pages/main/plan_statis_card.dart';
import 'package:makeaplan/ui/widgets/card/phase_summary_card.dart';
import 'package:makeaplan/ui/widgets/card/task_card.dart';
import 'package:makeaplan/ui/widgets/fade_in.dart';
import 'package:makeaplan/ui/widgets/imgnotice/empty_content.dart';
import 'package:makeaplan/ui/widgets/imgnotice/server_unavailable.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_context_menu.dart';
import 'package:makeaplan/ui/widgets/map_progress_indicator.dart';
import 'package:makeaplan/ui/widgets/map_scaffold.dart';
import 'package:makeaplan/ui/widgets/map_status_button.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/ui/widgets/rounded_icon_text_button.dart';
import 'package:makeaplan/ui/widgets/time_range.dart';
import 'package:makeaplan/utils/utils.dart';

class PlanPage extends StatefulWidget {
  final ValueNotifier<int> refreshNotifier;
  final VoidCallback onRefresh;
  final VoidCallback onDeleted;
  final int selectedPlanID;
  final bool canBack;
  final bool forceShowIndexPanel;
  final bool archived;

  const PlanPage(
      {Key key,
      this.refreshNotifier,
      this.selectedPlanID,
      this.canBack = true,
      this.archived = false,
      this.onRefresh,
      this.forceShowIndexPanel = false,
      this.onDeleted})
      : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  AnimationController _indexPanelHideOrShowAnimationController;
  Animation<double> _indexPanelHideOrShowAnimation;

  bool _somethingInProgress = false;
  bool _indexPanelShow;

  /// ////////////////////////////////////////////////////////////////////////// Status define
  int _highlightStatis;

  pb.PlanSummary _planSummary;

  List<pb.Task> _tasks = List();
  List<pb.PhaseSummary> _phases = List();
  bool _emptyList = true;
  bool _loadListAnimFinished = false;

  bool _noPlanFound = false;
  bool _serverUnavailable = false;

  double _planIndexProgressIndicatorBeginValue = 0;
  double _planIndexProgressIndicatorValue = 0;

  /// ////////////////////////////////////////////////////////////////////////// Overwrite
  @override
  void dispose() {
    super.dispose();
    _indexPanelHideOrShowAnimationController?.dispose();
  }

  setupIndexPanelHideOrShow() {
    if (widget.forceShowIndexPanel) {
      _indexPanelShow = true;
    } else {
      _indexPanelShow = PreferenceManager().indexPanelStatus();
    }
    if (_indexPanelShow == null) {
      _indexPanelShow = true;
    }

    _indexPanelHideOrShowAnimationController = AnimationController(
        duration: Duration(milliseconds: duration_milliseconds_std),
        vsync: this);
    _indexPanelHideOrShowAnimation = _indexPanelHideOrShowAnimationController
        .drive(Tween(begin: 1.0, end: 0.0));
    if (!_indexPanelShow) {
      _indexPanelHideOrShowAnimationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    setupIndexPanelHideOrShow();
    widget.refreshNotifier?.addListener(_onRefresh);
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return MAPScaffold(
      appBarBackgroundColor: ThemManager().themColors().topPanel.background,
      inProgressMask: InProgressOffstage(
        inProgress: _somethingInProgress,
      ),
      onRefresh: _refreshAndNotifyParent,
      body: _buildBody(),
      appBar: _buildTopBar(),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////// Build UI
  _buildBody() {
    if (_noPlanFound) {
      return _buildNoData();
    }
    if (_serverUnavailable) {
      return _buildServerUnavailable();
    }
    return _planSummary == null ? Container() : _buildPlan();
  }

  _buildNoData() {
    return Center(
      child: EmptyContent(
        text: MessageManager(context).goAndStartAPlan,
        actionText: MessageManager(context).createPlan,
        onAction: _onCreatePlanPressed,
      ),
    );
  }

  _buildServerUnavailable() {
    return Center(
      child: UnexpectedHappen(
        text: MessageManager(context).serverUnavailable,
        onRefresh: _refreshAndNotifyParent,
      ),
    );
  }

  _buildPlan() {
    return Column(
      children: <Widget>[
        FadeIn(
          child: Container(
            color: ThemManager().themColors().topPanel.background,
            child: Column(
              children: <Widget>[
                Container(
                  height: padding_2x,
                ),
                buildTitleAndNote(
                  _planSummary.plan.title,
                  _planSummary.plan.note,
                  divider: TimeRange(
                    showOneDayPlanHit: true,
                    fontSize: ThemManager().fontSize().normal,
                    startTime: Utils.pb2DateTime(_planSummary.plan.startTime),
                    endTime: Utils.pb2DateTime(_planSummary.plan.endTime),
                    color: ThemManager().themColors().basic,
                  ),
                ),
                SizeTransition(
                  sizeFactor: _indexPanelHideOrShowAnimation,
                  axis: Axis.vertical,
                  child: _buildFullIndex(),
                ),
                Container(
                  height: widget.forceShowIndexPanel ? padding_2x : 0,
                ),
                Container(
                  height: widget.forceShowIndexPanel ? 0 : 28,
                  width: double.infinity,
                  color: ThemManager().themColors().basic.background,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: ThemManager().themColors().topPanel.background,
                        height: 14,
                      ),
                      Positioned(
                        right: padding_3x,
                        bottom: 0,
                        width: 28,
                        height: 28,
                        child: (emptyIndex(_planSummary) ||
                                widget.forceShowIndexPanel)
                            ? Container()
                            : _buildIndexPanelVisibleToggle(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: padding_2x,
            left: padding_2x,
            right: padding_2x,
          ),
          child: AnimatedList(
            key: _listKey,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index, animation) {
              return _buildListItem(animation, index);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: padding_x,
            left: padding_2x,
            right: padding_2x,
            bottom: padding_8x,
          ),
          child: _buildListItemStub(),
        ),
      ],
    );
  }

  _buildTopBar() {
    if (_planSummary == null || _noPlanFound || _serverUnavailable) {
      return null;
    }

    return Container(
      padding: EdgeInsets.only(left: padding_x, right: padding_2x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: widget.canBack
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ThemManager().themColors().topPanel.icon,
                    ),
                  )
                : null,
          ),
          MAPStatusButton(
            archived: widget.archived,
            startTime: Utils.pb2DateTime(_planSummary.plan.startTime),
            status: _planSummary.status,
            statusButtonItems: widget.archived ? _buildRecoveryPlan() : null,
            onMorePressed: widget.archived ? null : _onMoreClick,
          ),
        ],
      ),
    );
  }

  _onMoreClick() {
    showActionSheet(
        context,
        buildPlanSheetAction(
          _planSummary,
          onDelete: _onDeletePlan,
          onUpdate: _onUpdatePlan,
          onArchive: _onArchivePlan,
          onAddPhase: _onCreatePhaseClicked,
          onAddTask: _onCreateTaskClicked,
          onUpdateCompletedIndex: _onUpdateCompletedIndex,
        ));
  }

  _buildRecoveryPlan() {
    return <StatusButtonItem>[
      StatusButtonItem(
        _recoveryPlan,
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding_middle),
          child: Text(
            MessageManager(context).recover,
            style: TextStyle(
              color: ThemManager().themColors().colorfulButton.text,
              fontSize: ThemManager().fontSize().normal,
            ),
          ),
        ),
      ),
    ];
  }

  _buildFullIndex() {
    return Container(
      width: double.infinity,
      child: emptyIndex(_planSummary)
          ? null
          : Padding(
              padding: EdgeInsets.only(
                  left: padding_2x, right: padding_2x, top: padding_2x),
              child: PlanStatisCardV2(
                planSummary: _planSummary,
                highlightStatis: _highlightStatis,
                progressIndicator: TweenAnimationBuilder(
                    duration: Duration(milliseconds: duration_milliseconds_std),
                    tween: Tween<double>(
                        begin: _planIndexProgressIndicatorBeginValue,
                        end: _planIndexProgressIndicatorValue),
                    builder:
                        (BuildContext context, double value, Widget child) {
                      return MAPProgressIndicator(
                        backgroundColor: ThemManager()
                            .themColors()
                            .planIndexPanel
                            .background2,
                        color: ThemManager()
                            .themColors()
                            .planIndexPanel
                            .background,
                        innerLineColor: Colors.transparent,
                        dividerColor: ThemManager()
                            .themColors()
                            .planIndexPanel
                            .outerDivider,
                        height: 90,
                        content: _buildProgressIndicatorContent(value),
                        value: value,
                      );
                    }),
                onPressed: (selfIndex) {
                  setState(() {
                    _highlightStatis = selfIndex;
                  });
                  _doUpdatePlanIndexProgressIndicator();
                },
              ),
            ),
    );
  }

  _buildProgressIndicatorContent(progress) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              MessageManager(context)
                  .progressStatis(_highlightStatis, progress),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: ThemManager().themColors().planIndexPanel.text,
                fontSize: ThemManager().fontSize().larger,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: _highlightStatis == statisGoalIndex && !widget.archived
                  ? GestureDetector(
                      child: buildEditButton(),
                      onTap: _onUpdateCompletedIndex,
                    )
                  : null,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: padding_x),
          child: Text(
            MessageManager(context).planStatis(_highlightStatis, _planSummary),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: ThemManager().themColors().planIndexPanel.text,
              fontSize: ThemManager().fontSize().middle,
            ),
          ),
        ),
      ],
    );
  }

  _buildIndexPanelVisibleToggle() {
    return RotatedBox(
      quarterTurns: _indexPanelShow ? 90 : 0,
      child: GestureDetector(
        child: Container(
          decoration: ShapeDecoration(
            color: ThemManager().themColors().colorfulButton.background,
            shape: CircleBorder(),
          ),
          padding: EdgeInsets.all(padding_x),
          child: SvgPicture.asset(
            IconManager().doubleArrowDown,
            width: icon_size_2x,
            height: icon_size_2x,
            color: ThemManager().themColors().colorfulButton.icon,
          ),
        ),
        onTap: () {
          final ns = !_indexPanelShow;
          setState(() {
            _indexPanelShow = ns;
          });
          PreferenceManager().updateIndexPanelStatus(ns);
          if (ns) {
            _indexPanelHideOrShowAnimationController.reverse();
          } else {
            _indexPanelHideOrShowAnimationController.forward();
          }
        },
      ),
    );
  }

  _buildListItemStub() {
    final bool todoList = _planSummary.plan.type == pb.PlanType.TASK_LIST;

    if (widget.archived) {
      if (_emptyList) {
        return FadeIn(
          child: Padding(
            padding: const EdgeInsets.only(top: padding_4x),
            child: EmptyContent(
              text: todoList
                  ? MessageManager(context).noTask
                  : MessageManager(context).noPhase,
            ),
          ),
        );
      }

      return Container();
    }

    if (_emptyList) {
      return FadeIn(
        child: Padding(
          padding: const EdgeInsets.only(top: padding_4x),
          child: EmptyContent(
            text: todoList
                ? MessageManager(context).noTask
                : MessageManager(context).noPhase,
            actionText: todoList
                ? MessageManager(context).createTask
                : MessageManager(context).createPhase,
            onAction: todoList ? _onCreateTaskClicked : _onCreatePhaseClicked,
          ),
        ),
      );
    }

    if (_loadListAnimFinished) {
      // 使用 FadeIn 组件时动画无效
      return FutureBuilder(
        future: Future.delayed(Duration(microseconds: 0)),
        builder: (context, snapshot) {
          double op = 1;
          if (snapshot.connectionState == ConnectionState.waiting) {
            op = 0;
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: duration_milliseconds_std),
            opacity: op,
            child: todoList
                ? buildAddTaskItem(context, _planSummary.plan.id, null, () {
                    _onCreateTaskClicked();
                  })
                : _buildAddPhaseItem(),
          );
        },
      );
    }

    return buildStubText(MessageManager(context).inLoading);
  }

  _buildListItem(animation, index) {
    final bool todoList = _planSummary.plan.type == pb.PlanType.TASK_LIST;
    final item = todoList ? _buildTaskItem(index) : _buildPhaseItem(index);
    if (useNewPlanAnim) {
      return SizeTransition(
        sizeFactor: animation.drive(Tween(begin: 0.0, end: 1.0)),
        axis: Axis.vertical,
        child: item,
      );
    }

    return SlideTransition(
      position: animation.drive(Tween(
        begin: Offset.zero.translate(0, 0.5),
        end: Offset.zero.translate(0, 0.0),
      )),
      child: FadeTransition(
        opacity: animation,
        child: item,
      ),
    );
  }

  Padding _buildTaskItem(int index) {
    final task = _tasks[index];
    final actions = buildTaskSheetAction(
      task,
      onDelete: () => _onDeleteTask(index, task),
      onUpdate: () => _onUpdateTask(index, task),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: padding_middle, top: padding_middle),
      child: MAPContextMenu(
        actions: widget.archived ? null : actions,
        title: task.title,
        isTask: true,
        startTime: Utils.pb2DateTime(task.startTime),
        endTime: Utils.pb2DateTime(task.endTime),
        child: TaskCard(
          data: task,
          archived: widget.archived,
          moreActions: actions,
          onChanged: (v) {
            _onTaskCheckStateChanged(v, index);
          },
        ),
      ),
    );
  }

  _buildAddPhaseItem() {
    return Padding(
      padding: const EdgeInsets.only(top: padding_middle),
      child: RoundedIconTextButton(
        text: MessageManager(context).addPhase,
        onPressed: () {
          _onCreatePhaseClicked();
        },
      ),
    );
  }

  _buildPhaseItem(int index) {
    final data = _phases[index];
    final actions = buildPhaseSheetAction(
      data,
      onDelete: () => _onDeletePhase(data, index),
      onUpdate: () => _onUpdatePhase(data, index),
      onAddTask: () => _onCreatePhaseTask(data, index),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: padding_middle, top: padding_middle),
      child: MAPContextMenu(
        actions: widget.archived ? null : actions,
        title: data.phase.title,
        note: data.phase.note,
        startTime: Utils.pb2DateTime(data.phase.startTime),
        endTime: Utils.pb2DateTime(data.phase.endTime),
        child: PhaseSummaryCard(
          data: data,
          moreActions: actions,
          archived: widget.archived,
          plan: _planSummary.plan,
          onDeleted: () {
            _removePhase(data, index);
          },
          onRefresh: () {
            _refreshAndNotifyParent();
          },
        ),
      ),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////// Handle interaction

  _onCreatePhaseTask(pb.PhaseSummary phaseSummary, int index) {
    if (phaseSummary.taskStatis.total >= max_task_count) {
      showToast(context, MessageManager(context).maxTaskCountReached());
      return;
    }

    Utils.push(
        context,
        CreateTaskPage(
          plan: _planSummary.plan,
          phase: phaseSummary.phase,
          onRefresh: (v) async {
            _notifyParentRefresh();

            final nt = await PhaseService()
                .queryPhaseSummary(_planSummary.plan.id, phaseSummary.phase.id);
            setState(() {
              _phases[index] = nt;
            });
            _loadPlanSummary(loadList: false);
          },
        ));
  }

  _onUpdatePlan() {
    Utils.push(
        context,
        CreatePlanPage(
          plan: _planSummary.plan,
          onRefresh: (value) {
            _notifyParentRefresh();
            _loadPlanSummary(loadList: false);
          },
        ));
  }

  _onArchivePlan() {
    confirmArchive(
      context,
      _planSummary.plan.id,
      () async {
        if (widget.canBack) {
          _notifyParentDeleted();
          Navigator.pop(context);
        } else {
          await SelectedPlanManager().reset();
          _notifyParentRefresh();
          _onRefresh();
        }
      },
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
    );
  }

  _onDeletePlan() {
    confirmDelete(
      context,
      () => PlanService().deletePlan(_planSummary.plan.id),
      () async {
        if (widget.canBack) {
          _notifyParentDeleted();
          Navigator.pop(context);
        } else {
          await SelectedPlanManager().reset();
          _notifyParentRefresh();
          _onRefresh();
        }
      },
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
    );
  }

  _onUpdateTask(int index, pb.Task task) {
    Utils.push(
        context,
        CreateTaskPage(
          plan: _planSummary.plan,
          task: task,
          onRefresh: (v) async {
            _notifyParentRefresh();

            final nt = await TaskService().queryTask(task.id);
            setState(() {
              _tasks[index] = nt;
            });
          },
        ));
  }

  _onDeleteTask(int index, pb.Task task) {
    confirmDelete(
      context,
      () => TaskService().deleteTask(task.id),
      () {
        _notifyParentRefresh();

        removeListItem(_listKey, _tasks, _buildTaskItem(index), index,
            onAnimDismiss: () {
          if (_tasks.length == 0) {
            setState(() {
              _emptyList = true;
            });
          }
        });
        _loadPlanSummary(loadList: false);
      },
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
    );
  }

  _onUpdatePhase(pb.PhaseSummary data, int index) {
    Utils.push(
        context,
        CreatePhasePage(
          plan: _planSummary.plan,
          phase: data.phase,
          onRefresh: (value) {
            _notifyParentRefresh();
            handleCreateOrUpdateResult(value, onSuccess: () async {
              final nt = await PhaseService()
                  .queryPhaseSummary(_planSummary.plan.id, data.phase.id);
              setState(() {
                _loadPlanSummary(loadList: false);
                _phases[index] = nt;
              });
            });
          },
        ));
  }

  _removePhase(pb.PhaseSummary data, int index) {
    _notifyParentRefresh();

    removeListItem(_listKey, _phases, _buildPhaseItem(index), index,
        onAnimDismiss: () {
      if (_phases.length == 0) {
        setState(() {
          _emptyList = true;
        });
      }
    });
    _loadPlanSummary(loadList: false);
  }

  _onDeletePhase(pb.PhaseSummary data, int index) {
    confirmDelete(
      context,
      () => PhaseService().deletePhase(data.phase.id),
      () => _removePhase(data, index),
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
    );
  }

  Future<void> _refreshAndNotifyParent() async {
    _onRefresh();
    _notifyParentRefresh();
  }

  _notifyParentRefresh() {
    if (widget.onRefresh != null) {
      widget.onRefresh();
    }
  }

  _notifyParentDeleted() {
    if (widget.onDeleted != null) {
      widget.onDeleted();
    }
  }

  _onCreatePlanPressed() {
    Utils.push(context, CreatePlanPage(
      onRefresh: (v) {
        _refreshAndNotifyParent();
      },
    ));
  }

  _onCreatePhaseClicked() {
    if (!Utils.emptyList(_phases) && _phases.length >= max_phase_count) {
      showToast(context, MessageManager(context).maxPhaseCountReached());
      return;
    }

    Utils.push(
        context,
        CreatePhasePage(
          plan: _planSummary.plan,
          onRefresh: (v) {
            _notifyParentRefresh();
            handleCreateOrUpdateResult(v, onValue: () {
              if (Utils.emptyList(_phases)) {
                _onRefresh();
              } else {
                _addPhaseItem(v);
                _loadPlanSummary(loadList: false);
              }
            });
          },
        ));
  }

  _onUpdateCompletedIndex() {
    showNumberInputDialog(context, initNumber: _planSummary.plan.completedIndex,
        onConfirmed: (newN) {
      if (newN > _planSummary.plan.totalIndex) {
        showToast(
            context,
            MessageManager(context)
                .numberCanNotGreaterThan(_planSummary.plan.totalIndex),
            toastType: MAPToast.failedAlert);
        return;
      }

      startProgress(
        context,
        null,
        () =>
            PlanService().updatePlanCompletedIndex(newN, _planSummary.plan.id),
        onSuccess: (value) {
          showToast(context, MessageManager(context).updateSuccess);
          _notifyParentRefresh();

          setState(() {
            _highlightStatis = statisGoalIndex;
            _planSummary.plan.completedIndex = newN;
          });
          _doUpdatePlanIndexProgressIndicator();
        },
      );
    });
  }

  _onCreateTaskClicked() {
    if (!Utils.emptyList(_tasks) && _tasks.length >= max_task_count) {
      showToast(context, MessageManager(context).maxTaskCountReached());
      return;
    }

    Utils.push(
        context,
        CreateTaskPage(
          plan: _planSummary.plan,
          onRefresh: (v) {
            _notifyParentRefresh();
            if (Utils.emptyList(_tasks)) {
              _onRefresh();
            } else {
              addListItem(
                context,
                _listKey,
                _tasks,
                () => TaskService().queryTask(v),
                (vl) => vl,
                indexFinder: (v) => _tasks.length,
              );
              _loadPlanSummary(loadList: false);
            }
          },
        ));
  }

  _onTaskCheckStateChanged(bool checked, int index) {
    startProgress(
      context,
      null,
      () => TaskService().updateTaskCheckState(_tasks[index].id, checked),
      onSuccess: (value) {
        _notifyParentRefresh();

        setState(() {
          _tasks[index].checked = checked;
        });

        _loadPlanSummary(loadList: false);
      },
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
    );
  }

  /// ////////////////////////////////////////////////////////////////////////// Status update

  _loadPlanSummary({bool loadList = true}) {
    if (loadList) {
      setState(() {
        _planSummary = null;
        _noPlanFound = false;
        _serverUnavailable = false;
        _emptyList = false;
        _loadListAnimFinished = false;
      });

      _resetList();
    }

    startProgress(
      context,
      MessageManager(context).inLoading,
      () => _doLoadPlanSummary(),
      onSuccess: (value) {
        setState(() {
          _planSummary = value;
        });

        if (!emptyIndex(_planSummary)) {
          _initPlanIndexProgressIndicator();
        }
        if (loadList) {
          _loadList();
        }
      },
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
      onError: (e) {
        handleError(context, e, noDataFound: () {
          showToast(context, MessageManager(context).noData,
              toastType: MAPToast.failedAlert);
          setState(() {
            _noPlanFound = true;
          });
        }, unavailable: () {
          showToast(context, MessageManager(context).serverUnavailable,
              toastType: MAPToast.failedAlert);
          setState(() {
            _serverUnavailable = true;
          });
        });
      },
    );
  }

  _resetList() {
    setState(() {
      _tasks = List();
      _phases = List();
    });
  }

  _onRefresh() {
    _loadPlanSummary();
  }

  Future<pb.PlanSummary> _doLoadPlanSummary() async {
    if (widget.selectedPlanID != null) {
      return await PlanService().queryPlanSummary(widget.selectedPlanID);
    }

    final spl = await SelectedPlanManager().selectedPlan();
    if (spl == null) {
      throw grpc.GrpcError.notFound();
    }
    return await PlanService().queryPlanSummary(spl.id);
  }

  _initPlanIndexProgressIndicator() {
    int hs;
    if (!statisEmpty(_planSummary.taskStatis)) {
      hs = statisTaskIndex;
    } else if (!statisEmpty(_planSummary.phaseStatis)) {
      hs = statisPhaseIndex;
    } else if (!daysStatisEmpty(_planSummary)) {
      hs = statisDaysIndex;
    } else if (!indexStatisEmpty(_planSummary)) {
      hs = statisGoalIndex;
    }

    setState(() {
      _highlightStatis = hs;
    });
    _doUpdatePlanIndexProgressIndicator();
  }

  _loadList() async {
    var value;
    if (_planSummary.plan.type == pb.PlanType.TASK_LIST) {
      value = await TaskService().queryPlanTask(_planSummary.plan.id, null);
    } else {
      value = await PhaseService().queryPlanPhaseSummary(_planSummary.plan.id);
    }
    _doLoadList(value);
  }

  void _doUpdatePlanIndexProgressIndicator() {
    final nv = _calcPlanIndexProgressIndicatorValue();
    _planIndexProgressIndicatorBeginValue = _planIndexProgressIndicatorValue;
    setState(() {
      _planIndexProgressIndicatorValue = nv;
    });
  }

  double _calcPlanIndexProgressIndicatorValue() {
    final daysStatis = Utils.daysStatis(
      Utils.pb2DateTime(_planSummary.plan.startTime),
      Utils.pb2DateTime(_planSummary.plan.endTime),
    );

    if (_highlightStatis == statisPhaseIndex) {
      if (_planSummary.phaseStatis.completed == 0) {
        return 0;
      }

      return _planSummary.phaseStatis.completed /
          _planSummary.phaseStatis.total;
    }

    if (_highlightStatis == statisTaskIndex) {
      if (_planSummary.taskStatis.completed == 0) {
        return 0;
      }

      return _planSummary.taskStatis.completed / _planSummary.taskStatis.total;
    }

    if (_highlightStatis == statisDaysIndex) {
      if (daysStatis.passed <= 0) {
        return 0;
      }

      return (daysStatis.passed >= daysStatis.total
              ? daysStatis.total
              : daysStatis.passed) /
          daysStatis.total;
    }

    if (_highlightStatis == statisGoalIndex) {
      if (_planSummary.plan.completedIndex == null ||
          _planSummary.plan.completedIndex == 0) {
        return 0;
      }

      return _planSummary.plan.completedIndex / _planSummary.plan.totalIndex;
    }

    return -1;
  }

  Future<void> _doLoadList(List ps) async {
    final bool todolist = _planSummary.plan.type == pb.PlanType.TASK_LIST;

    if (Utils.emptyList(ps)) {
      setState(() {
        _emptyList = true;
      });
      return;
    }
    setState(() {
      _emptyList = false;
    });

    for (var i = 0; i < ps.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));

      if (todolist) {
        _tasks.add(ps[i]);
      } else {
        _phases.add(ps[i]);
      }

      _listKey.currentState.insertItem(i,
          duration:
              Duration(milliseconds: duration_milliseconds_list_item_anim));
    }

    await Future.delayed(
        Duration(milliseconds: 100 + duration_milliseconds_list_item_anim));
    setState(() {
      _loadListAnimFinished = true;
    });
  }

  _addPhaseItem(int newPhaseId) {
    addListItem(
      context,
      _listKey,
      _phases,
      () => PhaseService().queryPhaseSummary(_planSummary.plan.id, newPhaseId),
      (v) => v,
      indexFinder: (v) => _phases.length,
    );
  }

  _recoveryPlan() async {
    final value = await PlanService().queryPlanCount();
    if (value.activePlanCount == max_active_plan_count) {
      showNoticeDialog(
        context,
        MessageManager(context).maxPlanCountReached(),
      );
      return;
    }

    confirmRecoveryArchive(
      context,
      _planSummary.plan.id,
      onSuccess: (v) {
        _notifyParentRefresh();

        showToast(
            context, MessageManager(context).recoverySuccessForPlanWithCode(v),
            toastType: MAPToast.successAlert);
        Navigator.pop(context);
      },
      onDelayed: () {
        setState(() {
          _somethingInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _somethingInProgress = false;
        });
      },
    );
  }
}
