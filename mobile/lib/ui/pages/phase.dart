import 'package:flutter/material.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/phase_service.dart';
import 'package:makeaplan/service/task_service.dart';
import 'package:makeaplan/ui/pages/create_phase.dart';
import 'package:makeaplan/ui/pages/create_task.dart';
import 'package:makeaplan/ui/widgets/card/task_card.dart';
import 'package:makeaplan/ui/widgets/fade_in.dart';
import 'package:makeaplan/ui/widgets/imgnotice/empty_content.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_context_menu.dart';
import 'package:makeaplan/ui/widgets/map_scaffold.dart';
import 'package:makeaplan/ui/widgets/map_status_button.dart';
import 'package:makeaplan/ui/widgets/time_range.dart';
import 'package:makeaplan/utils/utils.dart';

import '../common.dart';

class PhasePage extends StatefulWidget {
  final pb.PhaseSummary phaseSummary;
  final pb.Plan plan;
  final bool archived;
  final VoidCallback onRefresh;
  final VoidCallback onDeleted;

  const PhasePage(
      {Key key,
      this.phaseSummary,
      this.plan,
      this.archived = false,
      this.onRefresh,
      this.onDeleted})
      : super(key: key);

  @override
  _PhasePageState createState() => _PhasePageState();
}

class _PhasePageState extends State<PhasePage> {
  bool _deleteInProgress = false;
  bool _emptyList = true;
  bool _loadListAnimFinished = false;

  pb.PhaseSummary _phaseSummary;
  List<pb.Task> _tasks = List();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

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

  @override
  void initState() {
    super.initState();

    _phaseSummary = widget.phaseSummary;
    _refreshList();
  }

  Future<void> _refreshList() async {
    setState(() {
      _loadListAnimFinished = false;
    });
    _resetList();

    startProgress(
      context,
      MessageManager(context).inLoading,
      () => TaskService().queryPlanTask(widget.plan.id, _phaseSummary.phase.id),
      onSuccess: (value) {
        _loadList(value);
      },
    );
    return;
  }

  _resetList() {
    for (var i = 0; i < _tasks.length; i++) {
      _listKey.currentState.removeItem(0, (context, animation) => Container());
    }
  }

  Future<void> _loadList(List v) async {
    if (Utils.emptyList(v)) {
      setState(() {
        _emptyList = true;
      });
      return;
    }

    setState(() {
      _emptyList = false;
      _tasks = List();
    });

    for (var item in v) {
      await Future.delayed(Duration(milliseconds: 100));

      final ii = _tasks.length;
      _tasks.add(item);
      _listKey.currentState.insertItem(ii,
          duration:
              Duration(milliseconds: duration_milliseconds_list_item_anim));
    }

    await Future.delayed(
        Duration(milliseconds: 100 + duration_milliseconds_list_item_anim));
    setState(() {
      _loadListAnimFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MAPScaffold(
      appBarBackgroundColor: ThemManager().themColors().topPanel.background,
      inProgressMask: InProgressOffstage(
        inProgress: _deleteInProgress,
      ),
      onRefresh: _refreshList,
      body: _buildBody(),
      appBar: _buildTopBar(),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        FadeIn(
          child: Container(
            padding: EdgeInsets.only(bottom: padding_x),
            color: ThemManager().themColors().topPanel.background,
            child: Column(
              children: <Widget>[
                Container(
                  height: padding_2x,
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: padding_2x,
                  ),
                  child: buildTitleAndNote(
                    _phaseSummary.phase.title,
                    _phaseSummary.phase.note,
                    divider: TimeRange(
                      fontSize: ThemManager().fontSize().normal,
                      color: ThemManager().themColors().basic,
                      startTime:
                          Utils.pb2DateTime(_phaseSummary.phase.startTime),
                      endTime: Utils.pb2DateTime(_phaseSummary.phase.endTime),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        buildContent(),
      ],
    );
  }

  _buildTopBar() {
    return Container(
      padding: EdgeInsets.only(left: padding_x, right: padding_2x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ThemManager().themColors().planCard.icon,
              ),
            ),
          ),
          MAPStatusButton(
            archived: widget.archived,
            startTime: _phaseSummary.phase.startTime == null
                ? null
                : Utils.pb2DateTime(_phaseSummary.phase.startTime),
            status: _phaseSummary.status,
            onMorePressed: widget.archived
                ? null
                : () {
                    showActionSheet(
                        context,
                        buildPhaseSheetAction(
                          _phaseSummary,
                          onDelete: _onDelete,
                          onUpdate: _onUpdate,
                          onAddTask: _onCreateTaskClicked,
                        ));
                  },
          ),
        ],
      ),
    );
  }

  buildContent() {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
          left: padding_2x,
          right: padding_2x,
          top: padding_x,
        ),
        child: buildList(),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: padding_2x,
            right: padding_2x,
            top: padding_x,
            bottom: padding_8x),
        child: _buildStub(),
      ),
    ]);
  }

  _buildStub() {
    if (widget.archived) {
      if (_emptyList) {
        return FadeIn(
          child: Padding(
            padding: const EdgeInsets.only(top: padding_4x),
            child: EmptyContent(
              text: MessageManager(context).noTask,
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
            text: MessageManager(context).noTask,
            actionText: MessageManager(context).createTask,
            onAction: _onCreateTaskClicked,
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
            child: buildAddTaskItem(
                context, widget.plan.id, _phaseSummary.phase.id, () {
              _onCreateTaskClicked();
            }),
          );
        },
      );
    }

    return buildStubText(MessageManager(context).inLoading);
  }

  buildList() {
    return AnimatedList(
      key: _listKey,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      initialItemCount: 0,
      itemBuilder: (context, index, animation) {
        return _buildListItem(animation, index);
      },
    );
  }

  _buildListItemContent(index) {
    if (Utils.emptyList(_tasks)) {
      return null;
    }

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
          moreActions: actions,
          data: task,
          archived: widget.archived,
          onChanged: (v) => _onTaskCheckStateChanged(index, v),
        ),
      ),
    );
  }

  _buildListItem(animation, int index) {
    final item = _buildListItemContent(index);
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
      child: item,
    );
  }

  _onCreateTaskClicked() {
    if (!Utils.emptyList(_tasks) && _tasks.length >= max_task_count) {
      showToast(context, MessageManager(context).maxTaskCountReached());
      return;
    }

    Utils.push(
        context,
        CreateTaskPage(
          plan: widget.plan,
          phase: _phaseSummary.phase,
          onRefresh: (v) {
            _notifyParentRefresh();
            if (Utils.emptyList(_tasks)) {
              _refreshList();
            } else {
              _addTaskItem(v);
            }
          },
        ));
  }

  _addTaskItem(newTaskID) {
    addListItem(
      context,
      _listKey,
      _tasks,
      () => TaskService().queryTask(newTaskID),
      (v) => v,
      indexFinder: (v) => _tasks.length,
    );
  }

  _onTaskCheckStateChanged(int index, bool checked) {
    startProgress(
      context,
      null,
      () => TaskService().updateTaskCheckState(_tasks[index].id, checked),
      onSuccess: (value) {
        setState(() {
          _tasks[index].checked = checked;
        });

        _notifyParentRefresh();
      },
      onDelayed: () {
        setState(() {
          _deleteInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _deleteInProgress = false;
        });
      },
    );
  }

  _onUpdateTask(index, pb.Task task) {
    Utils.push(
        context,
        CreateTaskPage(
          plan: widget.plan,
          phase: _phaseSummary.phase,
          task: task,
          onRefresh: (v) async {
            final nt = await TaskService().queryTask(task.id);
            setState(() {
              _tasks[index] = nt;
            });
          },
        ));
  }

  _onDeleteTask(index, pb.Task task) {
    confirmDelete(
      context,
      () => TaskService().deleteTask(task.id),
      () {
        _notifyParentRefresh();
        removeListItem(_listKey, _tasks, _buildListItemContent(index), index);
      },
      onDelayed: () {
        setState(() {
          _deleteInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _deleteInProgress = false;
        });
      },
    );
  }

  _onUpdate() {
    Utils.push(
        context,
        CreatePhasePage(
          plan: widget.plan,
          phase: _phaseSummary.phase,
          onRefresh: (v) {
            _notifyParentRefresh();
            handleCreateOrUpdateResult(v, onSuccess: () async {
              final nt = await PhaseService()
                  .queryPhaseSummary(widget.plan.id, _phaseSummary.phase.id);
              setState(() {
                _phaseSummary = nt;
              });
            });
          },
        ));
  }

  _onDelete() {
    confirmDelete(
      context,
      () => PhaseService().deletePhase(_phaseSummary.phase.id),
      () {
        _notifyParentDeleted();
        Navigator.pop(context);
      },
      onDelayed: () {
        setState(() {
          _deleteInProgress = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _deleteInProgress = false;
        });
      },
    );
  }
}
