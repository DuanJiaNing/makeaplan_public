import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/api/task_service.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/service/task_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/ui/widgets/time_range_select.dart';
import 'package:makeaplan/ui/widgets/user_input.dart';
import 'package:makeaplan/utils/utils.dart';

class CreateTaskPage extends StatefulWidget {
  final pb.Plan plan;
  final pb.Phase phase;
  final pb.Task task;
  final ValueCallback onRefresh;

  const CreateTaskPage({
    Key key,
    this.plan,
    this.phase,
    this.task,
    this.onRefresh,
  }) : super(key: key);

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  DateTime _startTime;
  DateTime _endTime;
  String _title;

  bool _saveInProgress = false;

  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _titleController.addListener(() {
      _title = _titleController.text;
    });

    if (widget.task != null) {
      _startTime = Utils.pb2DateTime(widget.task.startTime);
      _endTime = Utils.pb2DateTime(widget.task.endTime);
      _title = widget.task.title;
      _titleController.text = _title;
    }
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
  }

  _onSave() {
    final handler = CreateTaskHandler(
      context,
      widget.plan.id,
      widget.phase?.id,
      title: _title,
      startTime: _startTime,
      endTime: _endTime,
      update: widget.task != null,
      taskId: widget.task?.id,
    );
    startProgress(
      context,
      MessageManager(context).inSaving,
      handler.handle,
      verify: handler.verify,
      onDelayed: () {
        setState(() {
          _saveInProgress = true;
        });
      },
      onSuccess: (v) {
        _notifyParentRefresh(v);
        showToast(context, MessageManager(context).saveSuccess,
            toastType: MAPToast.successAlert);
        waitThenPop(context);
      },
      onDelayedDismiss: () {
        setState(() {
          _saveInProgress = false;
        });
      },
    );
  }

  _notifyParentRefresh(v) {
    if (widget.onRefresh != null) {
      widget.onRefresh(v);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getFocusToHideKeyBoard(context);
      },
      child: Stack(
        children: <Widget>[
          _buildContent(),
          InProgressOffstage(
            inProgress: _saveInProgress,
          ),
        ],
      ),
    );
  }

  _buildContent() {
    return Scaffold(
      appBar: buildSavableAppBar(
          widget.task == null
              ? MessageManager(context).createTask
              : MessageManager(context).updateTask,
          saveButtonText: _saveInProgress
              ? MessageManager(context).inSaving
              : MessageManager(context).save,
          onSavePressed: _saveInProgress ? null : _onSave),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: padding_8x),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: padding_4x, left: padding_2x, right: padding_2x),
              child: UserInput(
                controller: _titleController,
                hint: MessageManager(context).enterNote,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: padding_3x, left: padding_2x, right: padding_2x),
              child: TimeRangeSelector(
                icon: TimeRangeSelector.iconTime,
                startText: MessageManager(context).chooseStartTime,
                endText: MessageManager(context).chooseEndTime,
                initStartTime: _startTime,
                initEndTime: _endTime,
                datePickerMode: CupertinoDatePickerMode.dateAndTime,
                minimumStartDate: _getMinimumDate(),
                maximumStartDate: _endTime ?? _getMaximumDate(),
                minimumEndDate: _startTime ?? _getMinimumDate(),
                maximumEndDate: _getMaximumDate(),
                dateAndTimeMode: true,
                onClearStartTimePressed: () {
                  setState(() {
                    _startTime = null;
                  });
                },
                onClearEndTimePressed: () {
                  setState(() {
                    _endTime = null;
                  });
                },
                onStartTimeSaved: (d) {
                  setState(() {
                    _startTime = d;
                  });
                },
                onEndTimeSaved: (d) {
                  setState(() {
                    _endTime = d;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getMinimumDate() {
    return Utils.zeroTimestamp(widget.phase?.startTime)
        ? Utils.pb2DateTime(widget.plan.startTime)
        : Utils.pb2DateTime(widget.phase.startTime);
  }

  _getMaximumDate() {
    return Utils.zeroTimestamp(widget.phase?.endTime)
        ? Utils.pb2DateTime(widget.plan.endTime)
        : Utils.pb2DateTime(widget.phase.endTime);
  }
}

class CreateTaskHandler {
  final BuildContext context;
  final int planId;
  final int phaseId;
  final String title;

  final DateTime endTime;
  final DateTime startTime;

  final bool update;
  final int taskId;

  CreateTaskHandler(
    this.context,
    this.planId,
    this.phaseId, {
    this.title,
    this.startTime,
    this.endTime,
    this.update = false,
    this.taskId,
  });

  bool verify() {
    return verifyTitle(title);
  }

  bool verifyTitle(String title) {
    if (title == null || title.length == 0) {
      showToast(context, MessageManager(context).inputTitlePlease,
          toastType: MAPToast.failedAlert);
      return false;
    }

    final len = max_title_count;
    final res = title.length > len;
    if (res) {
      showToast(context, MessageManager(context).maxTitleTextLengthReached(len),
          toastType: MAPToast.failedAlert);
    }

    return !res;
  }

  Future<dynamic> handle() async {
    if (update) {
      return await handleUpdate();
    }

    return await handleCreate();
  }

  Future<void> handleUpdate() async {
    final req = pb.UpdateTaskRequest.create();
    req.taskId = taskId;
    req.title = title;
    if (startTime != null) {
      req.startTime = Utils.dateTime2Pb(startTime);
    }
    if (endTime != null) {
      req.endTime = Utils.dateTime2Pb(endTime);
    }

    return await TaskService().updateTask(req);
  }

  Future<int> handleCreate() async {
    final req = pb.CreateTaskRequest.create();
    req.planId = planId;
    req.title = title;
    if (phaseId != null) {
      req.phaseId = Utils.pbInt32(phaseId);
    }
    if (startTime != null) {
      req.startTime = Utils.dateTime2Pb(startTime);
    }
    if (endTime != null) {
      req.endTime = Utils.dateTime2Pb(endTime);
    }

    return await TaskService().createTask(req);
  }
}
