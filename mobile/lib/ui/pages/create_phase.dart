import 'package:flutter/material.dart';
import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/phase_service.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/service/phase_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/ui/widgets/time_range_select.dart';
import 'package:makeaplan/ui/widgets/user_input.dart';
import 'package:makeaplan/utils/utils.dart';

class CreatePhasePage extends StatefulWidget {
  final pb.Plan plan;
  final pb.Phase phase;
  final ValueCallback onRefresh;

  const CreatePhasePage({Key key, this.plan, this.phase, this.onRefresh})
      : super(key: key);

  @override
  _CreatePhasePageState createState() => _CreatePhasePageState();
}

class _CreatePhasePageState extends State<CreatePhasePage> {
  DateTime _endTime;
  DateTime _startTime;

  String _title;
  String _note;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  bool _saveInProgress = false;
  bool _noteInputEnable = false;

  bool _inUpdateMode() {
    return widget.phase != null;
  }

  @override
  void initState() {
    super.initState();

    _titleController.addListener(() {
      _title = _titleController.text;
    });
    _noteController.addListener(() {
      _note = _noteController.text;
    });

    if (_inUpdateMode()) {
      _startTime = Utils.pb2DateTime(widget.phase.startTime);
      _endTime = Utils.pb2DateTime(widget.phase.endTime);
      _title = widget.phase.title;
      _titleController.text = _title;
      if (!Utils.emptyString(widget.phase.note)) {
        _note = widget.phase.note;
        _noteController.text = _note;
        _noteInputEnable = true;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _noteController.dispose();
  }

  _notifyParentRefresh(v) {
    if (widget.onRefresh != null) {
      widget.onRefresh(v);
    }
  }

  _onSave() {
    save() {
      final handler = CreatePhaseHandler(
        context,
        widget.plan,
        title: _title,
        startTime: _startTime,
        endTime: _endTime,
        note: _note,
        update: _inUpdateMode(),
        phaseId: widget.phase?.id,
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

    if (_inUpdateMode() &&
        (_startTime != Utils.pb2DateTime(widget.phase.startTime) ||
            _endTime != Utils.pb2DateTime(widget.phase.endTime))) {
      showConfirmDialog(
        context,
        MessageManager(context).warning,
        MessageManager(context).warningPhaseTimeRangeChange,
        confirmText: MessageManager(context).leanAndGoOn,
        onTrue: save,
      );
    } else {
      save();
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
        _inUpdateMode()
            ? MessageManager(context).updatePhase
            : MessageManager(context).createPhase,
        saveButtonText: _saveInProgress
            ? MessageManager(context).inSaving
            : MessageManager(context).save,
        onSavePressed: _saveInProgress ? null : _onSave,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: padding_8x),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: padding_4x, left: padding_2x, right: padding_2x),
              child: UserInput(
                controller: _titleController,
                hint: MessageManager(context).enterTitle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: padding_3x, left: padding_2x, right: padding_2x),
              child: TimeRangeSelector(
                icon: TimeRangeSelector.iconCalendar,
                startText: MessageManager(context).chooseStartDate,
                endText: MessageManager(context).chooseEndDate,
                initStartTime: _startTime,
                initEndTime: _endTime,
                minimumStartDate: Utils.pb2DateTime(widget.plan.startTime),
                maximumStartDate:
                    _endTime ?? Utils.pb2DateTime(widget.plan.endTime),
                minimumEndDate:
                    _startTime ?? Utils.pb2DateTime(widget.plan.startTime),
                maximumEndDate: Utils.pb2DateTime(widget.plan.endTime),
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
                onStartTimeSaved: _setupStartTime,
                onEndTimeSaved: _setupEndTime,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: padding_3x, left: padding_2x, right: padding_2x),
              child: buildNoteInput(context, _noteInputEnable, () {
                getFocusToHideKeyBoard(context);
                setState(() {
                  _noteInputEnable = true;
                });
              }, controller: _noteController),
            ),
          ],
        ),
      ),
    );
  }

  _setupStartTime(DateTime d) {
    setState(() {
      _startTime = DateTime(d.year, d.month, d.day);
    });
  }

  _setupEndTime(DateTime d) {
    final nd = DateTime(d.year, d.month, d.day, 23, 59, 59);
    setState(() {
      _endTime = nd;
    });
  }
}

class CreatePhaseHandler {
  final BuildContext context;
  final pb.Plan plan;

  final DateTime endTime;
  final DateTime startTime;

  final String title;
  final String note;

  final bool update;
  final int phaseId;

  CreatePhaseHandler(
    this.context,
    this.plan, {
    this.endTime,
    this.startTime,
    this.title,
    this.note,
    this.update = false,
    this.phaseId,
  });

  bool verify() {
    if (!verifyTitle(title)) {
      return false;
    }
    if (!verifyNote(note)) {
      return false;
    }
    if (!verifyTime(startTime, endTime)) {
      return false;
    }

    return true;
  }

  Future<dynamic> handle() async {
    if (update) {
      return await handleUpdate();
    }
    return await handleCreate();
  }

  Future<bool> handleUpdate() async {
    final req = pb.UpdatePhaseRequest.create();
    req.phaseId = phaseId;
    req.title = title;
    if (!Utils.emptyString(note)) {
      req.note = Utils.pbString(note);
    }
    if (startTime != null) {
      req.startTime = Utils.dateTime2Pb(startTime);
    }
    req.endTime = Utils.dateTime2Pb(endTime);
    await PhaseService().updatePhase(req);
    return true;
  }

  Future<int> handleCreate() async {
    final req = pb.CreatePhaseRequest.create();
    req.planId = plan.id;

    req.title = title;
    if (note != null) {
      req.note = Utils.pbString(note);
    }
    if (startTime != null) {
      req.startTime = Utils.dateTime2Pb(startTime);
    }
    req.endTime = Utils.dateTime2Pb(endTime);
    return await PhaseService().createPhase(req);
  }

  bool verifyTime(DateTime start, DateTime end) {
    if (end == null) {
      showToast(context, MessageManager(context).chooseEndDatePlease,
          toastType: MAPToast.failedAlert);
      return false;
    }

    return true;
  }

  bool verifyNote(String note) {
    if (Utils.emptyString(note)) {
      note = null;
      return true;
    }

    const len = max_note_count;
    if (note.length > len) {
      showToast(context, MessageManager(context).maxNoteTextLengthReached(len),
          toastType: MAPToast.failedAlert);
      return false;
    }
    return true;
  }

  bool verifyTitle(String title, {bool checkEmpty = true}) {
    if (checkEmpty && (title == null || title.length == 0)) {
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
}
