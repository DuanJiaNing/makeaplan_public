import 'package:flutter/material.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/font_size.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/model/plan_summary_todolist_task.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/map_progress_indicator.dart';
import 'package:makeaplan/ui/widgets/small_outline_button.dart';
import 'package:makeaplan/ui/widgets/time_range.dart';
import 'package:makeaplan/utils/utils.dart';

class PlanSummaryCard extends StatelessWidget {
  final PlanSummaryWithTodoListTask planData;
  final VoidCallback onPressed;
  final List<SheetAction> moreActions;
  final VoidCallback onArchive;
  final bool active;
  final MAPFontSize fontSize;

  static const _showTakCount = 3;

  const PlanSummaryCard({
    Key key,
    this.planData,
    this.onPressed,
    this.onArchive,
    this.active = true,
    this.fontSize,
    this.moreActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getCardColor();
    return Material(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0, color: color.outerDivider),
          borderRadius: BorderRadius.circular(radius_2x)),
      color: color.background,
      elevation: elevation_x,
      shadowColor: color.shadowColor,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        onPressed: active ? onPressed : null,
        child: Container(
          padding: EdgeInsets.only(
            left: padding_2x,
            top: padding_2x,
            right: padding_2x,
            bottom: padding_smallest,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TimeRange(
                    showOneDayPlanHit: true,
                    fontSize: fontSize.normal,
                    startTime:
                        Utils.pb2DateTime(planData.planSummary.plan.startTime),
                    endTime:
                        Utils.pb2DateTime(planData.planSummary.plan.endTime),
                    color: color,
                  ),
                  _buildStatus(context),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: padding_2x),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildCodeAndProgress(),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.only(left: padding_middle),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              child: _buildTitle(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: padding_middle),
                              child: _buildStatis(context),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: padding_smallest),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: _emptyGoalIndex()
                                        ? null
                                        : _buildIndex(context),
                                  ),
                                  Container(
                                    child: active
                                        ? InkWell(
                                            borderRadius: BorderRadius.circular(
                                                radius_2x),
                                            onTap: () => _onTapMore(context),
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  padding_smallest),
                                              child: Icon(
                                                Icons.more_horiz,
                                                color: color.icon,
                                                size: icon_size_4x,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _emptyGoalIndex() {
    return planData.planSummary.plan.totalIndex == null ||
        planData.planSummary.plan.totalIndex == 0;
  }

  _buildTaskItem(String text, bool last) {
    final color = getCardColor();
    return Row(
      children: <Widget>[
        Container(
          child: last
              ? null
              : Container(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(
                          side: BorderSide(color: color.divider, width: 2))),
                ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: padding_x),
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: color.text2,
                  fontSize: fontSize.small,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }

  _getStatisText(BuildContext context, pb.PlanSummary planSummary) {
    final ps = MessageManager(context)
        .planPhaseStatis(planSummary.phaseStatis, planSummary.plan.type);

    final ts = ps +
        ", " +
        MessageManager(context).planOrPhaseTaskStatis(planSummary.taskStatis);

    if (Utils.zeroTimestamp(planSummary.plan.endTime)) {
      return ts;
    }

    return ts +
        ", " +
        MessageManager(context).planOrPhaseDayStatis(
            Utils.pb2DateTime(planSummary.plan.startTime),
            Utils.pb2DateTime(planSummary.plan.endTime),
            planSummary.status);
  }

  /// 计划阶段，任务量和目标指标统计
  _buildStatis(BuildContext context) {
    final planSummary = planData.planSummary;
    final color = getCardColor();
    return Text(
      _getStatisText(context, planSummary),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color.text2,
          fontSize: fontSize.normal,
          fontWeight: FontWeight.normal),
    );
  }

  _buildIndex(BuildContext context) {
    final color = getCardReverseColor();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding_x, vertical: 2),
      decoration: ShapeDecoration(
          color: color.background,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.5,
                color: color.divider,
              ),
              borderRadius: BorderRadius.circular(radius_smallest))),
      child: Text(
          MessageManager(context).planGoalIndex(
              planData.planSummary.plan.totalIndex,
              planData.planSummary.plan.completedIndex),
          style: TextStyle(
              color: color.text,
              fontSize: fontSize.small,
              fontWeight: FontWeight.normal)),
    );
  }

  StyleColor getCardColor() {
    return planData.planSummary.status == pb.CommonStatus.NOT_STARTED_YET
        ? ThemManager().themColors().planCard
        : ThemManager().themColors().planCardHighlight;
  }

  StyleColor getCardReverseColor() {
    return planData.planSummary.status == pb.CommonStatus.NOT_STARTED_YET
        ? ThemManager().themColors().cardReversedPart
        : ThemManager().themColors().cardReversedPartHighlight;
  }

  /// 计划标题
  _buildTitle() {
    final color = getCardColor();
    return Text(
      planData.planSummary.plan.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          letterSpacing: letter_spacing,
          color: color.text,
          fontSize: fontSize.large,
          fontWeight: FontWeight.bold),
    );
  }

  /// 计划状态
  _buildStatus(BuildContext context) {
    final color = getCardColor();
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: padding_x),
          child: planData.planSummary.status == pb.CommonStatus.FINISHED
              ? SmallOutlineButton(
                  text: "归档",
                  onPressed: onArchive,
                )
              : null,
        ),
        Text(
          getStatusText(context, planData.planSummary.status,
              Utils.pb2DateTime(planData.planSummary.plan.startTime)),
          style: TextStyle(
              color: color.text2,
              fontSize: fontSize.small,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _buildCodeAndProgress() {
    final color = getCardReverseColor();
    final color2 = getCardColor();

    final size = padding_3x;
    final pbsize = 10.0;

    Widget _buildPlanCode() {
      var c = planData.planSummary.taskStatis.completed ?? 0;
      var t = planData.planSummary.taskStatis.total ?? 0;
      var linearProgressIndicatorValue = (c == 0.0 && t == 0.0) ? 0.0 : c / t;

      return Column(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: ShapeDecoration(
                color: color.background,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.5, color: color.divider),
                    borderRadius: BorderRadius.circular(radius_smallest))),
            child: Center(
              child: Text(
                planData.planSummary.plan.code,
                style: TextStyle(
                    color: color.text,
                    fontSize: fontSize.large,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Container(
            width: size,
            height: pbsize,
            padding: EdgeInsets.only(top: padding_smallest),
            child: MAPProgressIndicator(
              innerLineHeight: 2,
              dividerColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              innerLineColor: color2.divider,
              color: color2.primary,
              value: linearProgressIndicatorValue,
            ),
          ),
        ],
      );
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildPlanCode(),
          Container(
            height: size + pbsize + padding_smallest,
            width: 1,
            color: color2.divider,
          ),
        ],
      ),
    );
  }

  _onTapMore(BuildContext context) {
    showActionSheet(
      context,
      moreActions,
    );
  }
}
