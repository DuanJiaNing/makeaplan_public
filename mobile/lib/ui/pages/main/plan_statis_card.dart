import 'package:flutter/material.dart';
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/pages/main/common.dart';

const int statisPhaseIndex = 1;
const int statisTaskIndex = 2;
const int statisDaysIndex = 3;
const int statisGoalIndex = 4;

class PlanStatisCardV2 extends StatelessWidget {
  final pb.PlanSummary planSummary;
  final int highlightStatis;
  final ValueChanged onPressed;
  final Widget progressIndicator;

  const PlanStatisCardV2(
      {Key key,
      this.planSummary,
      this.highlightStatis,
      this.onPressed,
      this.progressIndicator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          progressIndicator,
          _buildBottom(),
        ],
      ),
    );
  }

  _buildBottom() {
    List<Widget> list = List();
    if (!statisEmpty(planSummary.phaseStatis)) {
      list.add(_buildSelector(MessageManager(null).phase, statisPhaseIndex));
    }
    if (!statisEmpty(planSummary.taskStatis)) {
      list.add(_buildSelector(MessageManager(null).task, statisTaskIndex));
    }
    if (!daysStatisEmpty(planSummary)) {
      list.add(_buildSelector(MessageManager(null).time, statisDaysIndex));
    }
    if (!indexStatisEmpty(planSummary)) {
      list.add(_buildSelector(MessageManager(null).goalIndex, statisGoalIndex));
    }

    return Padding(
      padding: const EdgeInsets.only(
          left: padding_x, right: padding_x, top: padding_2x),
      child: Container(
        child: Row(
          children: list,
        ),
      ),
    );
  }

  _buildSelector(text, selfIndex) {
    return Padding(
      padding: EdgeInsets.only(right: padding_smallest),
      child: GestureDetector(
        onTap: () {
          onPressed(selfIndex);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(
              horizontal: padding_2x, vertical: padding_smallest),
          duration: Duration(milliseconds: duration_milliseconds_std),
          decoration: ShapeDecoration(
            color: selfIndex == highlightStatis
                ? ThemManager().themColors().topPanel.background2
                : ThemManager().themColors().topPanel.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_3x),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: ThemManager().fontSize().middle,
                color: ThemManager().themColors().topPanel.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
