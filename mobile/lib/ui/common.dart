import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/plan_service.pb.dart' as pb;
import 'package:makeaplan/api/statistics.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/font_size.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/ui/error_page.dart';
import 'package:makeaplan/ui/widgets/colorful_button.dart';
import 'package:makeaplan/ui/widgets/fade_in.dart';
import 'package:makeaplan/ui/widgets/fluttertoast.dart';
import 'package:makeaplan/ui/widgets/go_back_icon_button.dart';
import 'package:makeaplan/ui/widgets/map_bottom_sheet.dart';
import 'package:makeaplan/ui/widgets/map_bottom_slidable_list_sheet.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/ui/widgets/map_transform.dart';
import 'package:makeaplan/ui/widgets/rounded_icon_text_button.dart';
import 'package:makeaplan/ui/widgets/rounded_outline_button.dart';
import 'package:makeaplan/ui/widgets/title_text.dart';
import 'package:makeaplan/ui/widgets/user_input.dart';
import 'package:makeaplan/utils/grpc_error.dart';
import 'package:makeaplan/utils/utils.dart';

String currentToastMsg;
bool toastShowing = false;

removeCustomToast(FToast ft) {
  clearToastMark();
  ft.removeCustomToast();
}

clearToastMark() {
  currentToastMsg = null;
  toastShowing = false;
}

FToast showToast(
  BuildContext context,
  String msg, {
  int toastType,
  bool infinity = false,
  Duration duration = const Duration(seconds: 2),
  VoidCallback onEnd,
}) {
  if (context == null) {
    print("context no more exist, message: [$msg] will not show up.");
    return null;
  }

  if (toastShowing && currentToastMsg == msg) {
    print("same toast has showing");
    return null;
  }

  if (infinity) {
    duration = Duration(minutes: 30);
  }

  FToast _fToast = FToast(context);

  currentToastMsg = msg;
  toastShowing = true;

  _fToast.showToast(
    onCancel: () {
      if (onEnd != null) {
        onEnd();
      }
      clearToastMark();
    },
    child: FutureBuilder(
      future: Future.delayed(Duration(seconds: 0)),
      builder: (context, snapshot) {
        double op = 1;
        double tp = MediaQuery.of(context).padding.top;
        if (snapshot.connectionState == ConnectionState.waiting) {
          op = 0.0;
          tp = MediaQuery.of(context).padding.top - 10;
        }

        int dur = duration_milliseconds_std;
        return AnimatedPadding(
          padding: EdgeInsets.only(top: tp),
          duration: Duration(milliseconds: dur),
          curve: Curves.easeIn,
          child: AnimatedOpacity(
            opacity: op,
            duration: Duration(milliseconds: dur),
            child: MAPToast(
              toastType: toastType,
              msg: msg,
            ),
          ),
        );
      },
    ),
    gravity: ToastGravity.TOP,
    toastDuration: duration,
  );

  return _fToast;
}

AppBar buildSavableAppBar(
  String title, {
  String saveButtonText,
  VoidCallback onSavePressed,
  VoidCallback onGoBack,
}) {
  if (Utils.emptyString(saveButtonText)) {
    saveButtonText = MessageManager(null).save;
  }

  return AppBar(
    brightness: ThemManager().getBrightnessForAppBar(),
    centerTitle: false,
    title: TitleText(
      title: title,
    ),
    leading: GoBackIconButton(
      onGoBack: onGoBack,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: <Widget>[
      Container(
        child: onSavePressed == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: padding_4x),
                child: buildSaveBtn(onSavePressed, saveButtonText),
              ),
      ),
    ],
  );
}

buildSaveBtn(VoidCallback btnOnPress, String btnText) {
  return ColorfulButton(
    text: btnText,
    onPressed: btnOnPress,
  );
}

typedef CupertinoDatePickerSavedCallback = void Function(DateTime dateTime);

showDatePickerSheet(
  BuildContext context,
  String text,
  CupertinoDatePickerSavedCallback callback, {
  CupertinoDatePickerMode datePickerMode = CupertinoDatePickerMode.date,
  DateTime minimumDate,
  DateTime maximumDate,
  DateTime initialDateTime,
}) {
  if (minimumDate == null) {
    minimumDate = Utils.minimumSelectableDate();
  }
  if (maximumDate == null) {
    maximumDate = Utils.maximumSelectableDate();
  }
  if (initialDateTime == null) {
    initialDateTime = DateTime.now();
  }
  if (minimumDate.isAfter(initialDateTime)) {
    initialDateTime = minimumDate;
  }
  if (maximumDate.isBefore(initialDateTime)) {
    initialDateTime = maximumDate;
  }

  DateTime _selectedTime = initialDateTime;

  showModalBottomSheet(
      context: context,
      backgroundColor: ThemManager().themColors().dialog.background,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius_2x),
              topRight: Radius.circular(radius_2x))),
      builder: (context) {
        return MAPBottomSheet(
          topBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    color: ThemManager().themColors().basic.text,
                    fontSize: ThemManager().fontSize().larger,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
              Row(
                children: <Widget>[
                  buildCancelBtn(
                    context,
                    () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    width: padding_x,
                  ),
                  buildSaveBtn(
                    () {
                      callback(_selectedTime ?? DateTime.now());
                      Navigator.of(context).pop();
                    },
                    MessageManager(context).save,
                  ),
                ],
              ),
            ],
          ),
          height: 400,
          content: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                    color: ThemManager().themColors().basic.text,
                    fontSize: ThemManager().fontSize().largest),
              ),
            ),
            child: CupertinoDatePicker(
                initialDateTime: initialDateTime,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                mode: datePickerMode,
                onDateTimeChanged: (dateTime) {
                  _selectedTime = dateTime;
                }),
          ),
        );
      });
}

RoundedOutlineButton buildCancelBtn(
    BuildContext context, VoidCallback onPressed) {
  return RoundedOutlineButton(
    title: MessageManager(context).cancel,
    onPressed: onPressed,
  );
}

MAPTransform buildNoteInput(
    BuildContext context, bool noteInputEnable, VoidCallback showNoteInput,
    {TextEditingController controller}) {
  return MAPTransform(
    showAfter: noteInputEnable,
    before: RoundedIconTextButton(
      text: MessageManager(context).addNote,
      onPressed: showNoteInput,
    ),
    after: UserInput(
      hint: MessageManager(context).enterNoteHint,
      controller: controller,
      lines: 10,
    ),
  );
}

Future showSelectSheet(BuildContext context, String title, List<Widget> content,
    {bool dragUpEnable = true, double height}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return MAPSlidableListBottomSheet(
          height: height,
          dragUpEnable: dragUpEnable,
          topBar: Container(
            padding: EdgeInsets.only(bottom: padding_2x),
            child: Text(
              title,
              style: TextStyle(
                  letterSpacing: letter_spacing,
                  color: ThemManager().themColors().basic.text,
                  fontSize: ThemManager().fontSize().larger,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          content: content,
        );
      });
}

buildTopBlankAppBar(BuildContext context, bool show) {
  return Positioned(
    top: 0,
    left: 0,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).padding.top,
    child: Opacity(
      opacity: show ? 1.0 : 0.0,
      child: Container(
        color: ThemManager().themColors().basic.background,
      ),
    ),
  );
}

buildAddTaskItem(
    BuildContext context, int planId, int phaseId, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.only(top: padding_middle),
    child: RoundedIconTextButton(
      text: MessageManager(null).addTask,
      onPressed: onPressed,
    ),
  );
}

class SheetAction {
  final String title;
  final VoidCallback action;

  SheetAction(this.title, this.action);
}

void showActionSheet(BuildContext context, List<SheetAction> actions) {
  int l = 0;
  for (var a in actions) {
    if (a != null) {
      l++;
    }
  }

  final tileHeight = 60.0;
  showSelectSheet(
      context,
      MessageManager(null).chooseAction,
      actions.map((a) {
        if (a == null) {
          return null;
        }
        return Material(
          color: ThemManager().themColors().dialog.background,
          child: SizedBox(
            height: tileHeight,
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(left: padding_3x, right: padding_3x),
              onTap: () {
                Navigator.pop(context);
                a.action();
              },
              title: Text(
                a.title,
                style: TextStyle(
                  fontSize: ThemManager().fontSize().large,
                  color: ThemManager().themColors().basic.text,
                ),
              ),
            ),
          ),
        );
      }).toList(),
      dragUpEnable: false,
      height: l * tileHeight + 130);
}

List<SheetAction> buildPlanSheetAction(
  pb.PlanSummary planSummary, {
  VoidCallback onDelete,
  VoidCallback onUpdate,
  VoidCallback onArchive,
  VoidCallback onAddPhase,
  VoidCallback onAddTask,
  VoidCallback onUpdateCompletedIndex,
}) {
  List<SheetAction> sa = List();
  if (planSummary.status == pb.CommonStatus.FINISHED) {
    sa.add(SheetAction(
      MessageManager(null).archive,
      onArchive,
    ));
  }
  sa.add(SheetAction(
    MessageManager(null).updatePlan,
    onUpdate,
  ));
  if (planSummary.plan.totalIndex != null && planSummary.plan.totalIndex > 0) {
    sa.add(SheetAction(
      MessageManager(null).updateCompletedIndex,
      onUpdateCompletedIndex,
    ));
  }
  final todoList = planSummary.plan.type == pb.PlanType.TASK_LIST;
  sa.add(SheetAction(
    todoList ? MessageManager(null).addTask : MessageManager(null).addPhase,
    todoList ? onAddTask : onAddPhase,
  ));

  sa.add(SheetAction(
    MessageManager(null).delete,
    onDelete,
  ));
  return sa;
}

List<SheetAction> buildTaskSheetAction(
  pb.Task task, {
  VoidCallback onDelete,
  VoidCallback onUpdate,
}) {
  List<SheetAction> sa = List();
  sa.add(SheetAction(
    MessageManager(null).updateTask,
    onUpdate,
  ));
  sa.add(SheetAction(
    MessageManager(null).delete,
    onDelete,
  ));
  return sa;
}

List<SheetAction> buildPhaseSheetAction(
  pb.PhaseSummary phaseSummary, {
  VoidCallback onDelete,
  VoidCallback onUpdate,
  VoidCallback onAddTask,
}) {
  List<SheetAction> sa = List();
  sa.add(SheetAction(
    MessageManager(null).updatePhase,
    onUpdate,
  ));
  sa.add(SheetAction(
    MessageManager(null).addTask,
    onAddTask,
  ));
  sa.add(SheetAction(
    MessageManager(null).delete,
    onDelete,
  ));
  return sa;
}

bool inErrorPage = false;

handleError(
  BuildContext context,
  dynamic e, {
  StackTrace trace,
  VoidCallback noDataFound,
  VoidCallback unavailable,
  VoidCallback defaulz,
}) {
  if (GRPCError.noDataFound(e) && noDataFound != null) {
    noDataFound();
    return;
  }
  if (GRPCError.unavailable(e) && unavailable != null) {
    unavailable();
    return;
  }
  if (defaulz != null) {
    defaulz();
    return;
  } else {
    if (!inErrorPage) {
      inErrorPage = true;
      Utils.push(
          context,
          ErrorPage(
            error: e,
          ));
    }
  }
}

typedef NumberValueCallback = Function(int value);

showNumberInputDialog(BuildContext context,
    {int initNumber, NumberValueCallback onConfirmed}) {
  final itext = initNumber == null || initNumber == 0 ? "" : "$initNumber";
  final TextEditingController _textEditingController =
      TextEditingController.fromValue(TextEditingValue(text: itext));
  showInputDialog(
    context,
    MessageManager(context).inputNumber,
    _textEditingController,
    keyboardType: TextInputType.number,
    hint: MessageManager(null).inputNumberPlease,
    onConfirmed: () {
      if (onConfirmed != null) {
        final v = _textEditingController.text;
        if (Utils.emptyString(v)) {
          showToast(context, MessageManager(null).inputNumberPlease);
          return;
        }
        final c = int.tryParse(v);
        if (c == null) {
          showToast(context, MessageManager(null).inputNumberPlease);
          return;
        }
        if (c < 0) {
          showToast(context, MessageManager(null).positiveNumberOnly);
          return;
        }
        onConfirmed(c);
      }
    },
  );
}

showInputDialog(
  BuildContext context,
  String title,
  TextEditingController controller, {
  String hint,
  String confirmText,
  TextInputType keyboardType,
  VoidCallback onCanceled,
  VoidCallback onConfirmed,
}) {
  if (confirmText == null) {
    confirmText = MessageManager(context).save;
  }

  showDialog(
      context: context,
      builder: (diaCtx) {
        return SimpleDialog(
          backgroundColor: ThemManager().themColors().dialog.background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_x)),
          title: TitleText(title: title),
          children: <Widget>[
            SimpleDialogOption(
              padding: EdgeInsets.only(
                  left: padding_3x, right: padding_3x, top: padding_2x),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 800,
                ),
                child: UserInput(
                  hint: hint,
                  controller: controller,
                  keyboardType: keyboardType,
                ),
              ),
            ),
            SimpleDialogOption(
              padding: EdgeInsets.only(right: padding_3x, top: padding_3x),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  buildCancelBtn(
                    diaCtx,
                    () {
                      Navigator.pop(diaCtx);
                      if (onCanceled != null) {
                        onCanceled();
                      }
                    },
                  ),
                  Container(
                    width: padding_middle,
                  ),
                  buildSaveBtn(
                    () {
                      Navigator.pop(diaCtx);
                      if (onConfirmed != null) {
                        onConfirmed();
                      }
                    },
                    confirmText,
                  )
                ],
              ),
            )
          ],
        );
      });
}

showConfirmDialog(
  BuildContext context,
  String title,
  String notice, {
  String confirmText,
  VoidCallback onTrue,
  VoidCallback onFalse,
}) async {
  if (confirmText == null) {
    confirmText = MessageManager(context).confirm;
  }
  final res = await showDialog<bool>(
      context: context,
      builder: (diaCtx) {
        return buildNoticeDialog(
          diaCtx,
          title: title,
          notice: notice,
          confirmText: confirmText,
        );
      });
  if (res == null) {
    return;
  }

  if (res && onTrue != null) {
    onTrue();
  }
  if (!res && onFalse != null) {
    onFalse();
  }
}

showNoticeDialog(BuildContext context, String notice) {
  showDialog<bool>(
      context: context,
      builder: (diaCtx) {
        return buildNoticeDialog(diaCtx, notice: notice, hideBtn: true);
      });
}

buildNoticeDialog(
  BuildContext context, {
  String title,
  String notice,
  String confirmText,
  bool hideBtn = false,
}) {
  return SimpleDialog(
    backgroundColor: ThemManager().themColors().dialog.background,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius_x),
        side:
            BorderSide(color: ThemManager().themColors().dialog.outerDivider)),
    title: title == null ? null : TitleText(title: title),
    children: <Widget>[
      SimpleDialogOption(
        child: Container(
          child: Text(
            notice,
            style: TextStyle(
              letterSpacing: letter_spacing,
              fontSize: ThemManager().fontSize().middle,
              color: ThemManager().themColors().basic.text2,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      Container(
        child: hideBtn
            ? null
            : SimpleDialogOption(
                padding: EdgeInsets.only(
                    top: padding_3x, left: padding_3x, right: padding_3x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildCancelBtn(
                      context,
                      () => Navigator.pop(context, false),
                    ),
                    Container(
                      width: padding_middle,
                    ),
                    buildSaveBtn(
                      () => Navigator.pop(context, true),
                      confirmText,
                    )
                  ],
                ),
              ),
      )
    ],
  );
}

typedef FutureCallback = Future<dynamic> Function();
typedef VerifyCallback = bool Function();
typedef ValueCallback = dynamic Function(dynamic value);

waitThenPop(BuildContext context) async {
  await Future.delayed(
      Duration(milliseconds: duration_milliseconds_wait_for_toast));
  Navigator.of(context).pop();
}

startProgress(
    BuildContext context, String inProgressText, FutureCallback doThing,
    {VerifyCallback verify,
    VoidCallback onStart,
    VoidCallback onComplete,
    ValueCallback onSuccess,
    ValueCallback onError,
    VoidCallback onDelayed,
    VoidCallback onDelayedDismiss,
    bool popAfterSuccess = false}) {
  if (verify != null && !verify()) {
    return;
  }

  if (onStart != null) {
    onStart();
  }

  RPCCall(
    context,
    doThing,
    onDelayed: onDelayed,
    onDelayedDismiss: onDelayedDismiss,
  ).make(
    inProgressText: inProgressText,
    then: (value) {
      if (popAfterSuccess) {
        Navigator.of(context).pop(true);
      } else {
        if (onSuccess != null) {
          onSuccess(value);
        }
      }
    },
    catchError: (err) {
      if (onError != null) {
        onError(err);
      } else {
        handleError(context, err);
      }
    },
    whenComplete: () {
      if (onComplete != null) {
        onComplete();
      }
    },
  );
}

class RPCCall<T> {
  bool finished = false;
  FToast ft;

  final BuildContext context;
  final FutureCallback fut;

  final VoidCallback onDelayed;
  final VoidCallback onDelayedDismiss;

  RPCCall(this.context, this.fut, {this.onDelayed, this.onDelayedDismiss});

  dismissToastIfShow() {
    if (!finished && onDelayedDismiss != null) {
      onDelayedDismiss();
    }
    finished = true;
    if (ft != null) {
      removeCustomToast(ft);
    }
  }

  make<R>(
      {String inProgressText,
      FutureOr<R> then(T value),
      Function catchError,
      FutureOr whenComplete()}) {
    if (Utils.emptyString(inProgressText)) {
      inProgressText = MessageManager(null).inProcessing;
    }

    Future.delayed(Duration(milliseconds: max_rpc_wait_milliseconds))
        .then((value) {
      if (!finished) {
        if (onDelayed != null) {
          onDelayed();
        }
        ft = showToast(
          context,
          inProgressText,
          toastType: MAPToast.inProgressAlert,
          infinity: true,
        );
      }
    });

    fut().then((value) {
      dismissToastIfShow();
      if (then != null) {
        then(value);
      }
    }).catchError((err) {
      dismissToastIfShow();
      if (catchError != null) {
        catchError(err);
      } else {
        handleError(context, err);
      }
    }).whenComplete(() {
      dismissToastIfShow();
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }
}

confirmDelete(BuildContext context, FutureCallback fut, VoidCallback success,
    {VoidCallback onDelayed, VoidCallback onDelayedDismiss}) {
  showConfirmDialog(
      context, MessageManager(null).warning, MessageManager(null).warningDelete,
      onTrue: () {
    startProgress(
      context,
      MessageManager(null).inProcessing,
      fut,
      onSuccess: (v) {
        showToast(context, MessageManager(null).deleteSuccess,
            toastType: MAPToast.successAlert);
        success();
      },
      onDelayed: onDelayed,
      onDelayedDismiss: onDelayedDismiss,
    );
  });
}

confirmArchive(BuildContext context, int planId, VoidCallback success,
    {VoidCallback onDelayed, VoidCallback onDelayedDismiss}) {
  showConfirmDialog(
      context, MessageManager(null).alert, MessageManager(null).alertForArchive,
      onTrue: () {
    startProgress(
      context,
      MessageManager(null).inProcessing,
      () => PlanService()
          .updatePlanArchiveState(pb.UpdatePlanArchiveStateRequest.create()
            ..planId = planId
            ..archived = true),
      onSuccess: (v) {
        showToast(context, MessageManager(null).archiveSuccess,
            toastType: MAPToast.successAlert);
        success();
      },
      onDelayed: onDelayed,
      onDelayedDismiss: onDelayedDismiss,
    );
  });
}

confirmRecoveryArchive(BuildContext context, int planId,
    {VoidCallback onDelayed,
    VoidCallback onDelayedDismiss,
    ValueCallback onSuccess}) {
  showConfirmDialog(context, MessageManager(null).alert,
      MessageManager(null).alertForRecoveryPlan, onTrue: () {
    startProgress(
      context,
      MessageManager(null).inProcessing,
      () => PlanService()
          .updatePlanArchiveState(pb.UpdatePlanArchiveStateRequest.create()
            ..planId = planId
            ..archived = false),
      onSuccess: onSuccess,
      onDelayed: onDelayed,
      onDelayedDismiss: onDelayedDismiss,
    );
  });
}

var useNewPlanAnim = false;

setupListItemAnimMark() async {
  useNewPlanAnim = true;
  await Future.delayed(
      Duration(milliseconds: duration_milliseconds_list_item_anim));
  useNewPlanAnim = false;
}

typedef ListIndexFinder = int Function(dynamic value);

addListItem(BuildContext context, GlobalKey<AnimatedListState> key, List list,
    FutureCallback fut, ValueCallback getValue,
    {ListIndexFinder indexFinder}) async {
  final value = await fut();
  var index = 0;
  if (indexFinder != null) {
    index = indexFinder(value);
  }

  setupListItemAnimMark();
  list.insert(index, getValue(value));

  key.currentState.insertItem(index,
      duration: Duration(milliseconds: duration_milliseconds_list_item_anim));
}

removeListItem(
  GlobalKey<AnimatedListState> key,
  List list,
  Widget child,
  int index, {
  VoidCallback onAnimDismiss,
}) {
  list.removeAt(index);
  key.currentState.removeItem(index, (context, animation) {
    if (onAnimDismiss != null) {
      animation.addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          onAnimDismiss();
        }
      });
    }

    return SizeTransition(
      sizeFactor: animation.drive(Tween(begin: 0, end: 1)),
      axis: Axis.vertical,
      child: child,
    );
  }, duration: Duration(milliseconds: duration_milliseconds_list_item_anim));
}

buildTitleAndNote(
  String title,
  note, {
  MAPFontSize fs,
  bool unlimitedMaxLines = false,
  Widget divider,
  bool showTipWhenEmptyNote = false,
}) {
  if (fs == null) {
    fs = ThemManager().fontSize();
  }
  if (Utils.emptyString(note)) {
    note = showTipWhenEmptyNote ? MessageManager(null).noNote : null;
  }
  return Column(
    children: <Widget>[
      Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(
              right: padding_3x,
              left: padding_3x,
            ),
            child: Text(
              title,
              maxLines: unlimitedMaxLines ? 100 : 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                letterSpacing: letter_spacing,
                color: ThemManager().themColors().topPanel.text,
                fontSize: fs.larger,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Container(
        child: divider != null
            ? Container(
                padding: EdgeInsets.only(
                  right: padding_3x,
                  left: padding_3x,
                  top: padding_2x,
                ),
                child: divider,
              )
            : null,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: note == null
            ? null
            : Container(
                padding: EdgeInsets.only(
                  right: padding_3x,
                  left: padding_3x,
                  top: padding_2x,
                ),
                child: Text(
                  note,
                  overflow: TextOverflow.ellipsis,
                  maxLines: unlimitedMaxLines ? 100 : 4,
                  style: TextStyle(
                    letterSpacing: letter_spacing,
                    color: ThemManager().themColors().topPanel.text2,
                    fontSize: fs.middle,
                  ),
                ),
              ),
      ),
    ],
  );
}

handleCreateOrUpdateResult(
  result, {
  VoidCallback onSuccess,
  VoidCallback onValue,
  VoidCallback onFailed,
}) {
  if (result != null) {
    if (result is bool) {
      if (result) {
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        if (onFailed != null) {
          onFailed();
        }
      }
      return;
    }

    if (onValue != null) {
      onValue();
    }
  }
}

buildStubText(String text) {
  return FadeIn(
    child: Center(
      child: Container(
        padding: EdgeInsets.only(top: padding_8x),
        child: Text(
          text,
          style: TextStyle(
            color: ThemManager().themColors().basic.text,
            fontSize: ThemManager().fontSize().middle,
          ),
        ),
      ),
    ),
  );
}

getStatusText(
  BuildContext context,
  pb.CommonStatus status,
  DateTime startTime, {
  bool archived = false,
}) {
  if (archived) {
    return MessageManager(context).archived;
  }
  if (status == pb.CommonStatus.NOT_STARTED_YET &&
      !Utils.zeroDateTime(startTime)) {
    return MessageManager(context).startAfter(startTime);
  }
  return MessageManager(context).commonStatus(status);
}

getTimeRangeIcon(StyleColor color, {bool time = false}) {
  final calendarLine = SvgPicture.asset(
    IconManager().calendarLine,
    width: icon_size_3x,
    height: icon_size_3x,
    color: color.icon,
  );
  final accessTime = Icon(
    IconManager().accessTime,
    size: icon_size_3x,
    color: color.icon,
  );

  return time ? accessTime : calendarLine;
}

buildEditButton() {
  return Opacity(
    opacity: 0.4,
    child: Container(
      padding: EdgeInsets.all(padding_smallest),
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.5, color: ThemManager().themColors().basic.divider),
          color: ThemManager().themColors().basic.background2,
          borderRadius: BorderRadius.circular(radius_2x)),
      child: Icon(
        Icons.edit,
        color: ThemManager().themColors().basic.icon,
        size: icon_size_3x,
      ),
    ),
  );
}
