import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class CardDate extends StatelessWidget {
  final DateTime date;
  final StyleColor color;
  final bool displayTime;
  final String text;
  final double fontSize;

  const CardDate(
      {Key key,
      this.date,
      this.color,
      this.displayTime = false,
      this.text,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text != null
          ? text
          : (displayTime
              ? MessageManager(context).displayTime(date)
              : MessageManager(context).displayDate(date)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color.text,
          fontSize: fontSize ?? ThemManager().fontSize().normal,
          fontWeight: FontWeight.normal),
    );
  }
}
