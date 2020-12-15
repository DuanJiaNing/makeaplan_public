import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/pages/common.dart';

class TimeSelectButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onClear;
  final DateTime dateTime;
  final bool dateAndTimeMode;
  final String text;

  const TimeSelectButton(
      {Key key,
      this.onPressed,
      this.dateTime,
      this.text,
      this.dateAndTimeMode = false,
      this.onClear})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: ThemManager().themColors().cleanButton.divider,
              width: 0.5),
          borderRadius: BorderRadius.circular(radius_x)),
      color: ThemManager().themColors().cleanButton.background,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius_x),
        onTap: () {
          getFocusToHideKeyBoard(context);
          onPressed();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: padding_x,
                  bottom: padding_x,
                  left: padding_2x,
                  right: onClear == null ? padding_2x : 0),
              child: Text(
                getText(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: ThemManager().themColors().cleanButton.text,
                  fontSize: ThemManager().fontSize().normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              child: onClear == null ? null : _buildClearButton(),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildClearButton() {
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(radius_3x),
        child: Container(
          padding: EdgeInsets.all(padding_x),
          child: Icon(
            IconManager().close,
            size: icon_size_3x,
            color: ThemManager().themColors().cleanButton.icon,
          ),
        ),
        onTap: onClear,
      ),
    );
  }

  String getText(BuildContext context) {
    return dateTime == null
        ? text
        : (dateAndTimeMode
            ? MessageManager(context).displayTime(dateTime)
            : MessageManager(context).displayDate(dateTime));
  }
}
