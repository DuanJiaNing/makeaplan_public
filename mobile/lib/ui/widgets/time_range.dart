import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/utils/utils.dart';

class TimeRange extends StatelessWidget {
  final bool displayAsTime;

  final DateTime startTime;
  final DateTime endTime;

  final bool showOneDayPlanHit;
  final bool showIcon;

  final double fontSize;

  final StyleColor color;

  const TimeRange({
    Key key,
    this.displayAsTime = false,
    this.startTime,
    this.endTime,
    this.showOneDayPlanHit = false,
    this.color,
    this.showIcon = true,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Utils.bothZeroTime(startTime, endTime)) {
      return Container();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: showIcon ? getTimeRangeIcon(color, time: displayAsTime) : null,
        ),
        Container(
          child: Container(
            padding: EdgeInsets.only(left: showIcon ? padding_x : 0),
            child: Text(
              MessageManager(context).timeRange(
                startTime,
                endTime,
                displayAsTime: displayAsTime,
                showOneDayPlanHit: showOneDayPlanHit,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: color.text,
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
