import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/statistics.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/preference/selected_plan.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/model/plan_summary_todolist_task.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/service/task_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/create_phase.dart';
import 'package:makeaplan/ui/pages/create_plan.dart';
import 'package:makeaplan/ui/pages/create_task.dart';
import 'package:makeaplan/ui/pages/plan_detail.dart';
import 'package:makeaplan/ui/widgets/card/plan_summary_card.dart';
import 'package:makeaplan/ui/widgets/imgnotice/add_more_plan.dart';
import 'package:makeaplan/ui/widgets/imgnotice/empty_content.dart';
import 'package:makeaplan/ui/widgets/imgnotice/server_unavailable.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_context_menu.dart';
import 'package:makeaplan/ui/widgets/map_scaffold.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/utils/utils.dart';

class PlansPage extends StatefulWidget {
  final ValueNotifier<int> refreshNotifier;
  final VoidCallback onRefresh;

  const PlansPage({Key key, this.onRefresh, this.refreshNotifier})
      : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  /// ////////////////////////////////////////////////////////////////////////// Status define
  List<PlanSummaryWithTodoListTask> _plans;
  bool _noDataFound = false;
  bool _serverUnavailable = false;
  bool _somethingInProgress = false;

  /// ////////////////////////////////////////////////////////////////////////// Overwrite
  @override
  void initState() {
    super.initState();
    widget.refreshNotifier?.addListener(_doLoadPlans);
    _doLoadPlans();
  }

  @override
  Widget build(BuildContext context) {
    return MAPScaffold(
      inProgressMask: InProgressOffstage(
        inProgress: _somethingInProgress,
      ),
      onRefresh: _doLoadPlans,
      body: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////// Build UI

  _buildBody() {
    if (_noDataFound) {
      return _buildNoData();
    }

    if (_serverUnavailable) {
      return _buildServerUnavailable();
    }

    return _plans == null
        ? buildStubText(MessageManager(context).inLoading)
        : _buildPlans();
  }

  _buildNoData() {
    return Center(
      child: EmptyContent(
        text: MessageManager(context).goAndStartAPlan,
        actionText: MessageManager(context).createPlan,
        onAction: _addButtonPressed,
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

  _buildPlans() {
    return Padding(
      padding: const EdgeInsets.only(bottom: padding_4x, top: padding_x),
      child: AnimatedList(
        key: _listKey,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        initialItemCount: _plans.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(animation, index);
        },
      ),
    );
  }

  _buildAppBar() {
    if (_plans == null || _noDataFound || _serverUnavailable) {
      return null;
    }

    return Container(
      padding: EdgeInsets.only(left: padding_3x, right: padding_2x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            MessageManager(context).plan,
            style: TextStyle(
                letterSpacing: letter_spacing,
                color: ThemManager().themColors().basic.text,
                fontSize: ThemManager().fontSize().largest),
          ),
          Container(
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: _addButtonPressed,
              icon: Icon(
                Icons.add,
                size: icon_size_6x,
                color: ThemManager().themColors().basic.icon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(Animation<double> animation, int index) {
    final item = _buildListItem(index);
    if (useNewPlanAnim) {
      return SizeTransition(
        sizeFactor: animation.drive(Tween(begin: 0, end: 1)),
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

  _buildListItem(int index) {
    if (Utils.emptyList(_plans)) {
      return null;
    }

    final str = _plans.length == max_active_plan_count
        ? MessageManager(context).maxPlanCountReached()
        : MessageManager(context)
            .leftPlanToCreate(max_active_plan_count - _plans.length);
    if (index == _plans.length) {
      return AddMorePlan(
        text: str,
      );
    }

    final actions = buildPlanSheetAction(
      _plans[index].planSummary,
      onArchive: () => _archivePlan(_plans[index], index),
      onDelete: () => _deletePlan(_plans[index], index),
      onUpdate: () => _updatePlan(_plans[index], index),
      onAddPhase: () => _onCreatePhaseClicked(_plans[index].planSummary, index),
      onAddTask: () => _onCreateTaskClicked(_plans[index].planSummary, index),
      onUpdateCompletedIndex: () =>
          _onUpdateCompletedIndex(_plans[index].planSummary.plan, index),
    );
    return MAPContextMenu(
      child: _buildPlan(_plans[index], index, actions),
      title: _plans[index].planSummary.plan.title,
      note: _plans[index].planSummary.plan.note,
      startTime: Utils.pb2DateTime(_plans[index].planSummary.plan.startTime),
      endTime: Utils.pb2DateTime(_plans[index].planSummary.plan.endTime),
      actions: actions,
    );
  }

  _buildPlan(PlanSummaryWithTodoListTask planData, int indexInListView,
      List<SheetAction> moreActions) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding_2x,
        right: padding_2x,
        bottom: padding_2x,
      ),
      child: PlanSummaryCard(
        fontSize: ThemManager().fontSize(),
        planData: planData,
        onArchive: () => _archivePlan(planData, indexInListView),
        moreActions: moreActions,
        onPressed: () => _onListItemPressed(planData, indexInListView),
      ),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////// Handle interaction

  _onCreateTaskClicked(pb.PlanSummary planSummary, int indexInListView) {
    if (planSummary.taskStatis.total >= max_task_count) {
      showToast(context, MessageManager(context).maxTaskCountReached());
      return;
    }

    Utils.push(
        context,
        CreateTaskPage(
          plan: planSummary.plan,
          onRefresh: (v) {
            _refreshItem(planSummary, indexInListView);
          },
        ));
  }

  _onUpdateCompletedIndex(pb.Plan plan, int indexInListView) {
    showNumberInputDialog(context, initNumber: plan.completedIndex,
        onConfirmed: (newN) {
      if (newN > plan.totalIndex) {
        showToast(context,
            MessageManager(context).numberCanNotGreaterThan(plan.totalIndex),
            toastType: MAPToast.failedAlert);
        return;
      }

      startProgress(
        context,
        null,
        () => PlanService().updatePlanCompletedIndex(newN, plan.id),
        onSuccess: (value) {
          showToast(context, MessageManager(context).updateSuccess);
          _notifyParentRefresh();
          setState(() {
            _plans[indexInListView].planSummary.plan.completedIndex = newN;
          });
        },
      );
    });
  }

  _onCreatePhaseClicked(pb.PlanSummary planSummary, int indexInListView) {
    if (planSummary.phaseStatis.total >= max_phase_count) {
      showToast(context, MessageManager(context).maxPhaseCountReached());
      return;
    }

    Utils.push(
        context,
        CreatePhasePage(
          plan: planSummary.plan,
          onRefresh: (v) {
            _refreshItem(planSummary, indexInListView);
          },
        ));
  }

  _addButtonPressed() {
    if (_plans?.length == max_active_plan_count) {
      showNoticeDialog(context, MessageManager(context).maxPlanCountReached());
      return;
    }

    Utils.push(context, CreatePlanPage(
      onRefresh: (value) {
        if (Utils.emptyList(_plans)) {
          _refreshAndNotifyParent();
        } else {
          _addItem(value.id);
        }
      },
    ));
  }

  _onListItemPressed(
      PlanSummaryWithTodoListTask planData, int indexInListView) {
    Utils.push(
        context,
        PlanDetailPage(
          selectedPlanID: planData.planSummary.plan.id,
          onDeleted: () {
            _notifyParentRefresh(); // archive 时也需要通知刷新。
            _removePlan(planData, indexInListView);
          },
          onRefresh: () {
            _refreshItem(planData.planSummary, indexInListView);
          },
        ));
  }

  _refreshItem(pb.PlanSummary planSummary, int indexInListView) async {
    final p = PlanSummaryWithTodoListTask();
    final nps = await PlanService().queryPlanSummary(planSummary.plan.id);
    p.planSummary = nps;
    if (nps.plan.type == pb.PlanType.TASK_LIST && nps.taskStatis.total > 0) {
      p.tasks = await TaskService().queryPlanTask(planSummary.plan.id, null);
    }
    setState(() {
      _plans[indexInListView] = p;
    });

    final sp = await SelectedPlanManager().selectedPlan();
    if (sp.id == planSummary.plan.id) {
      _notifyParentRefresh();
    }
  }

  _refreshAndNotifyParent() {
    _doLoadPlans();
    _notifyParentRefresh();
  }

  _notifyParentRefresh() {
    if (widget.onRefresh != null) {
      widget.onRefresh();
    }
  }

  /// ////////////////////////////////////////////////////////////////////////// Status update
  _doLoadPlans() {
    setState(() {
      _plans = null;
      _noDataFound = false;
      _serverUnavailable = false;
    });

    startProgress(
      context,
      MessageManager(context).inLoading,
      () => PlanService().queryActivePlanSummary(),
      onSuccess: (value) {
        _loadPlans(value);
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
            _noDataFound = true;
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

  _updatePlan(PlanSummaryWithTodoListTask planData, int index) {
    Utils.push(
        context,
        CreatePlanPage(
          plan: planData.planSummary.plan,
          onRefresh: (value) async {
            final np = await PlanService()
                .queryPlanSummary(planData.planSummary.plan.id);
            setState(() {
              _plans[index] = PlanSummaryWithTodoListTask()
                ..tasks = planData.tasks
                ..planSummary = np;
            });

            final sp = await SelectedPlanManager().selectedPlan();
            if (sp.id == planData.planSummary.plan.id) {
              _notifyParentRefresh();
            }
          },
        ));
  }

  _removePlan(PlanSummaryWithTodoListTask planData, int index) {
    removeListItem(_listKey, _plans, _buildPlan(planData, index, null), index,
        onAnimDismiss: () async {
      final ep = await SelectedPlanManager().selectedPlan();
      await SelectedPlanManager().reset();

      if (_plans?.length == 0) {
        _refreshAndNotifyParent();
        return;
      }

      if (ep.id == planData.planSummary.plan.id) {
        _notifyParentRefresh();
      }
    });
  }

  _archivePlan(PlanSummaryWithTodoListTask planData, int index) {
    confirmArchive(
      context,
      planData.planSummary.plan.id,
      () {
        _notifyParentRefresh();
        _removePlan(planData, index);
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

  _deletePlan(PlanSummaryWithTodoListTask planData, int index) {
    confirmDelete(
      context,
      () => PlanService().deletePlan(planData.planSummary.plan.id),
      () {
        _removePlan(planData, index);
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

  _addItem(int newPlanID) {
    addListItem(
      context,
      _listKey,
      _plans,
      () => PlanService().queryPlanSummary(newPlanID),
      (v) => PlanSummaryWithTodoListTask()..planSummary = v,
      indexFinder: (v) {
        var i = 0;
        for (var value in _plans) {
          if (v.plan.code.codeUnitAt(0) >
              value.planSummary.plan.code.codeUnitAt(0)) {
            i++;
          }
        }

        return i;
      },
    );
  }

  Future<void> _loadPlans(List<pb.PlanSummary> ps) async {
    setState(() {
      _plans = List();
    });
    for (var item in ps) {
      await Future.delayed(Duration(milliseconds: 100));

      var insertIndex = _plans.length;
      final p = PlanSummaryWithTodoListTask();
      p.planSummary = item;
      if (item.plan.type == pb.PlanType.TASK_LIST &&
          item.taskStatis.total > 0) {
        p.tasks = await TaskService().queryPlanTask(item.plan.id, null);
      }
      _plans.add(p);
      _listKey.currentState.insertItem(insertIndex,
          duration:
              Duration(milliseconds: duration_milliseconds_list_item_anim));
    }

    _listKey.currentState.insertItem(ps.length,
        duration: Duration(milliseconds: duration_milliseconds_list_item_anim));
  }
}
