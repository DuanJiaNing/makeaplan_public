import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/plan_service.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/model/planid_code.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/ui/widgets/map_transform.dart';
import 'package:makeaplan/ui/widgets/number_selector.dart';
import 'package:makeaplan/ui/widgets/rounded_icon_text_button.dart';
import 'package:makeaplan/ui/widgets/time_range_select.dart';
import 'package:makeaplan/ui/widgets/underline_button.dart';
import 'package:makeaplan/ui/widgets/user_input.dart';
import 'package:makeaplan/utils/utils.dart';

import 'common.dart';

class CreatePlanPage extends StatefulWidget {
  final pb.Plan plan;
  final ValueCallback onRefresh;

  const CreatePlanPage({Key key, this.plan, this.onRefresh}) : super(key: key);

  @override
  _CreatePlanPageState createState() => _CreatePlanPageState();
}

class _CreatePlanPageState extends State<CreatePlanPage> {
  bool _noteInputEnable = false;

  bool _saveInProgress = false;

  bool _goalIndexInputEnable = false;
  int _goalIndex;
  int _minGoalIndex;

  bool _phasedPlan = true;
  DateTime _startTime;
  DateTime _endTime;

  String _title;
  String _note;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  _notifyParentRefresh(v) {
    if (widget.onRefresh != null) {
      widget.onRefresh(v);
    }
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
      _title = widget.plan.title;
      _titleController.text = _title;
      _startTime = Utils.pb2DateTime(widget.plan.startTime);
      _endTime = Utils.pb2DateTime(widget.plan.endTime);
      _phasedPlan = widget.plan.type == pb.PlanType.PHASED;
      if (widget.plan.totalIndex != null && widget.plan.totalIndex > 0) {
        _goalIndexInputEnable = true;
        _goalIndex = widget.plan.totalIndex;
        _minGoalIndex = widget.plan.minIndex;
      }
      if (!Utils.emptyString(widget.plan.note)) {
        _note = widget.plan.note;
        _noteController.text = _note;
        _noteInputEnable = true;
      }
    }
  }

  bool _inCreateMode() {
    return widget.plan == null;
  }

  bool _inUpdateMode() {
    return widget.plan != null;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _noteController.dispose();
  }

  _onSave() {
    save() {
      final handler = CreatePlanHandler(
        context,
        title: _title,
        startTime: _startTime,
        endTime: _endTime,
        totalIndex: _goalIndex,
        minIndex: _minGoalIndex,
        note: _note,
        phasedPlan: _phasedPlan,
        update: _inUpdateMode(),
        planId: widget.plan?.id,
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

          showToast(
              context,
              _inCreateMode()
                  ? MessageManager(context).saveSuccessForPlanWithCode(v.code)
                  : MessageManager(context).saveSuccess,
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
        (_startTime != Utils.pb2DateTime(widget.plan.startTime) ||
            _endTime != Utils.pb2DateTime(widget.plan.endTime))) {
      showConfirmDialog(
        context,
        MessageManager(context).warning,
        MessageManager(context).warningPlanTimeRangeChange,
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
        _inCreateMode()
            ? MessageManager(context).createPlan
            : MessageManager(context).updatePlan,
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
              padding: EdgeInsets.only(top: _inUpdateMode() ? 0 : padding_3x),
              child: _inUpdateMode() ? null : _buildPlanTypeSelector(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: padding_3x, left: padding_2x, right: padding_2x),
              child: UserInput(
                controller: _titleController,
                hint: MessageManager(context).enterTitle,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: padding_3x, left: padding_2x, right: padding_2x),
              child: TimeRangeSelector(
                icon: TimeRangeSelector.iconCalendar,
                startText: MessageManager(context).chooseStartDate,
                endText: MessageManager(context).chooseEndDate,
                initStartTime: _startTime,
                initEndTime: _endTime,
                maximumStartDate: _endTime,
                minimumEndDate: _startTime,
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
                child: buildGoalIndexInput()),
            Padding(
              padding: EdgeInsets.only(
                  left: padding_3x, right: padding_3x, top: padding_x),
              child: Align(
                alignment: Alignment.centerRight,
                child: UnderlineButton(
                  onPressed: () => showNoticeDialog(
                      context, MessageManager(context).alertForPlanIndex),
                  text: MessageManager(context).aboutPlanIndex,
                ),
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

  _buildPlanTypeSelector() {
    final sdts = TextStyle(
      color: ThemManager().themColors().basic.text2,
      fontSize: ThemManager().fontSize().normal,
      fontWeight: FontWeight.normal,
    );
    final sts = TextStyle(
      color: ThemManager().themColors().colorfulButton.text,
      fontSize: ThemManager().fontSize().large,
      fontWeight: FontWeight.normal,
    );
    final ts = TextStyle(
      color: ThemManager().themColors().basic.text,
      fontSize: ThemManager().fontSize().middle,
      fontWeight: FontWeight.normal,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding_2x),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding_2x, vertical: 2),
        decoration: ShapeDecoration(
            color: ThemManager().themColors().basic.background2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius_x)))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: padding_middle),
              child: Text(
                MessageManager(context).choosePlanType,
                style: sdts,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: padding_2x, right: padding_smallest),
              child: Container(
                color: ThemManager().themColors().basic.divider,
                height: 20,
                width: 0.5,
              ),
            ),
            Expanded(
              child: CupertinoSlidingSegmentedControl(
                backgroundColor: Colors.transparent,
                thumbColor:
                    ThemManager().themColors().colorfulButton.background,
                children: {
                  1: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      MessageManager(context).phasedPlan,
                      style: _phasedPlan ? sts : ts,
                    ),
                  ),
                  2: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      MessageManager(context).taskList,
                      style: _phasedPlan ? ts : sts,
                    ),
                  ),
                },
                groupValue: _phasedPlan ? 1 : 2,
                onValueChanged: (newValue) {
                  if ((newValue == 1 && !_phasedPlan) ||
                      (newValue == 2 && _phasedPlan)) {
                    setState(() {
                      _phasedPlan = !_phasedPlan;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoalIndexInput() {
    final afterHeight = 50.0;
    return Material(
      child: MAPTransform(
        afterHeight: afterHeight,
        beforeHeight: 45.0,
        showAfter: _goalIndexInputEnable,
        before: RoundedIconTextButton(
          leading: SvgPicture.asset(
            IconManager().flag2Line,
            width: icon_size_3x,
            height: icon_size_3x,
            color: ThemManager().themColors().colorfulButton.icon,
          ),
          showLeadingAddIcon: false,
          text: MessageManager(context).setupGoalIndex,
          onPressed: () {
            getFocusToHideKeyBoard(context);
            setState(() {
              _goalIndexInputEnable = true;
              _goalIndex = 0;
              _minGoalIndex = 0;
            });
          },
        ),
        after: Container(
          padding: EdgeInsets.only(left: padding_middle),
          height: afterHeight,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_x),
              side: BorderSide(
                  width: 0.5, color: ThemManager().themColors().basic.divider),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${MessageManager(context).goalIndex}: ",
                    style: TextStyle(
                      color: ThemManager().themColors().basic.text,
                      fontSize: ThemManager().fontSize().middle,
                    ),
                  ),
                  NumberSelector(
                    initNumber: _goalIndex,
                    callback: (old, newN) {
                      setState(() {
                        _goalIndex = newN;
                      });

                      if (_minGoalIndex == 0 || _minGoalIndex > newN) {
                        setState(() {
                          _minGoalIndex = newN;
                        });
                      }
                    },
                  ),
                  Container(
                    width: padding_2x,
                  ),
                  Text(
                    "${MessageManager(context).lowestValue}: ",
                    style: TextStyle(
                      color: ThemManager().themColors().basic.text,
                      fontSize: ThemManager().fontSize().middle,
                    ),
                  ),
                  NumberSelector(
                    initNumber: _minGoalIndex,
                    maxNumber: _goalIndex != null && _goalIndex > 0
                        ? _goalIndex
                        : NumberSelector.defaultMaxNumber,
                    callback: (old, newN) {
                      setState(() {
                        _minGoalIndex = newN;
                      });
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      _goalIndex = null;
                      _minGoalIndex = null;
                      _goalIndexInputEnable = false;
                    });
                  },
                  iconSize: icon_size_4x,
                  color: ThemManager().themColors().basic.icon,
                  icon: Icon(IconManager().close),
                ),
              )
            ],
          ),
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

class CreatePlanHandler {
  final BuildContext context;

  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final int totalIndex;
  final int minIndex;
  final String note;
  final bool phasedPlan;

  final bool update;
  final int planId;

  CreatePlanHandler(this.context,
      {this.title,
      this.update,
      this.planId,
      this.startTime,
      this.endTime,
      this.totalIndex,
      this.minIndex,
      this.note,
      this.phasedPlan});

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
    if (!verifyIndex(totalIndex, minIndex)) {
      return false;
    }

    return true;
  }

  Future<PlanIDCode> handleCreate() async {
    final req = pb.CreatePlanRequest.create();
    req.title = title;
    if (note != null) {
      req.note = Utils.pbString(note);
    }
    req.startTime = Utils.dateTime2Pb(startTime);
    if (endTime != null) {
      req.endTime = Utils.dateTime2Pb(endTime);
    }
    if (totalIndex != null) {
      req.totalIndex = Utils.pbInt32(totalIndex);
    }
    if (minIndex != null) {
      req.minIndex = Utils.pbInt32(minIndex);
    }
    req.type = phasedPlan ? pb.PlanType.PHASED : pb.PlanType.TASK_LIST;
    final res = await PlanService().createPlan(req);
    return PlanIDCode(
      id: res.id,
      code: res.code,
    );
  }

  Future<bool> handleUpdate() async {
    final req = pb.UpdatePlanRequest.create();
    req.planId = planId;
    req.title = title;
    if (note != null) {
      req.note = Utils.pbString(note);
    }
    req.startTime = Utils.dateTime2Pb(startTime);
    if (endTime != null) {
      req.endTime = Utils.dateTime2Pb(endTime);
    }
    if (totalIndex != null) {
      req.totalIndex = Utils.pbInt32(totalIndex);
    }
    if (minIndex != null) {
      req.minIndex = Utils.pbInt32(minIndex);
    }
    await PlanService().updatePlan(req);
    return true;
  }

  // Call verify before handle.
  Future<dynamic> handle() async {
    if (update) {
      return await handleUpdate();
    }
    return await handleCreate();
  }

  bool verifyIndex(int goalIndex, int minGoalIndex) {
    if (goalIndex != null && goalIndex == 0) {
      showToast(context, MessageManager(context).totalIndexCanNotBeZero,
          toastType: MAPToast.failedAlert);
      return false;
    }

    return true;
  }

  bool verifyTime(DateTime start, DateTime end) {
    if (start == null) {
      showToast(context, MessageManager(context).chooseStartDatePlease,
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

    const len = max_title_count;
    final res = title.length > len;
    if (res) {
      showToast(context, MessageManager(context).maxTitleTextLengthReached(len),
          toastType: MAPToast.failedAlert);
    }

    return !res;
  }
}
