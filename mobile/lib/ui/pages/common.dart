import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/greeter_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/utils/utils.dart';

buildItem(
  String text, {
  VoidCallback onPressed,
  Widget trailing,
  bool showArrowRight = true,
}) {
  return InkWell(
    borderRadius: BorderRadius.all(Radius.circular(radius_x)),
    onTap: onPressed,
    child: Container(
      padding:
          EdgeInsets.symmetric(horizontal: padding_2x, vertical: padding_2x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: ThemManager().themColors().settingPanel.text,
              fontSize: ThemManager().fontSize().large,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              Container(child: trailing),
              Container(
                child: showArrowRight
                    ? Icon(
                        Icons.arrow_forward_ios,
                        size: icon_size_2x,
                        color: ThemManager().themColors().settingPanel.icon,
                      )
                    : null,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

buildItemDivder() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: padding_2x),
    child: Container(
      width: double.infinity,
      height: 0.5,
      color: ThemManager().themColors().settingPanel.divider,
    ),
  );
}

buildSegment(List<Widget> children) {
  return Material(
    color: ThemManager().themColors().settingPanel.background,
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: ThemManager().themColors().settingPanel.divider, width: 0.5),
        borderRadius: BorderRadius.circular(radius_x)),
    child: Column(
      children: children,
    ),
  );
}

buildThemStub(int tm) {
  final color = ThemManager().getColorByMode(tm);
  return Padding(
    padding: EdgeInsets.only(right: padding_x),
    child: Container(
      padding: EdgeInsets.all(padding_smallest),
      decoration: ShapeDecoration(
        color: color.basic.primary,
        shape: CircleBorder(
          side: BorderSide(
            color: color.basic.divider,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(padding_smallest),
        decoration: ShapeDecoration(
          color: color.basic.background,
          shape: CircleBorder(),
        ),
        child: Container(
          padding: EdgeInsets.all(padding_smallest),
          decoration: ShapeDecoration(
            color: color.basic.text,
            shape: CircleBorder(),
          ),
        ),
      ),
    ),
  );
}

getFocusToHideKeyBoard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

showUsernameUpdateDialog(
    BuildContext context, String username, ValueCallback onSuccess) {
  final TextEditingController _textEditingController = TextEditingController();
  if (!Utils.emptyString(username)) {
    _textEditingController.text = "$username";
  }

  showInputDialog(
    context,
    MessageManager(context).updateUsername,
    _textEditingController,
    hint: MessageManager(context).inputUsername,
    onConfirmed: () {
      final it = _textEditingController.text;
      const len = max_username_count;
      if (it.length > len) {
        showToast(context, MessageManager(context).maxTextLengthReached(len));
        return;
      }

      startProgress(
        context,
        null,
        () => GreeterService().updateUsername(it),
        onSuccess: onSuccess,
        popAfterSuccess: false,
      );
    },
  );
}
