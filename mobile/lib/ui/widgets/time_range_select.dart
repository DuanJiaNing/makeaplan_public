import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/time_select_button.dart';

class TimeRangeSelector extends StatelessWidget {
  static const iconCalendar = 1;
  static const iconTime = 2;

  final int icon;

  final String startText;
  final String endText;

  final DateTime initStartTime;
  final DateTime initEndTime;

  final VoidCallback onClearStartTimePressed;
  final VoidCallback onClearEndTimePressed;

  final CupertinoDatePickerSavedCallback onStartTimeSaved;
  final CupertinoDatePickerSavedCallback onEndTimeSaved;

  final DateTime maximumStartDate;
  final DateTime minimumStartDate;

  final DateTime maximumEndDate;
  final DateTime minimumEndDate;

  final CupertinoDatePickerMode datePickerMode;

  final bool dateAndTimeMode;

  const TimeRangeSelector({
    Key key,
    this.icon,
    this.startText,
    this.endText,
    this.initStartTime,
    this.initEndTime,
    this.onClearStartTimePressed,
    this.onClearEndTimePressed,
    this.onStartTimeSaved,
    this.onEndTimeSaved,
    this.maximumStartDate,
    this.minimumStartDate,
    this.maximumEndDate,
    this.minimumEndDate,
    this.datePickerMode = CupertinoDatePickerMode.date,
    this.dateAndTimeMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarLine = SvgPicture.asset(
      IconManager().calendarLine,
      width: icon_size_4x,
      height: icon_size_4x,
      color: ThemManager().themColors().basic.icon,
    );
    final accessTime = Icon(
      IconManager().accessTime,
      size: icon_size_4x,
      color: ThemManager().themColors().basic.icon,
    );

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 6),
            child: icon == iconCalendar ? calendarLine : accessTime,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: padding_x),
              child: Wrap(
                spacing: padding_2x,
                runSpacing: padding_2x,
                children: <Widget>[
                  TimeSelectButton(
                    text: startText,
                    dateTime: initStartTime,
                    dateAndTimeMode: dateAndTimeMode,
                    onClear:
                        initStartTime == null ? null : onClearStartTimePressed,
                    onPressed: () {
                      showDatePickerSheet(
                        context,
                        startText,
                        onStartTimeSaved,
                        datePickerMode: datePickerMode,
                        initialDateTime: initStartTime,
                        maximumDate: maximumStartDate,
                        minimumDate: minimumStartDate,
                      );
                    },
                  ),
                  TimeSelectButton(
                    text: endText,
                    dateTime: initEndTime,
                    dateAndTimeMode: dateAndTimeMode,
                    onClear: initEndTime == null ? null : onClearEndTimePressed,
                    onPressed: () {
                      showDatePickerSheet(
                        context,
                        endText,
                        onEndTimeSaved,
                        datePickerMode: datePickerMode,
                        initialDateTime: initEndTime,
                        maximumDate: maximumEndDate,
                        minimumDate: minimumEndDate,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
