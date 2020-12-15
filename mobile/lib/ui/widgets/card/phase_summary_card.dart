import 'package:flutter/material.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/phase.dart';
import 'package:makeaplan/ui/widgets/time_range.dart';
import 'package:makeaplan/utils/utils.dart';

class PhaseSummaryCard extends StatelessWidget {
  final pb.PhaseSummary data;
  final pb.Plan plan;
  final List<SheetAction> moreActions;
  final VoidCallback onRefresh;
  final VoidCallback onDeleted;
  final bool archived;

  const PhaseSummaryCard({
    Key key,
    this.data,
    this.plan,
    this.moreActions,
    this.onRefresh,
    this.archived = false,
    this.onDeleted,
  }) : super(key: key);

  StyleColor getColor() {
    if (data.status == pb.CommonStatus.IN_PROGRESS ||
        data.status == pb.CommonStatus.FINISHED) {
      return ThemManager().themColors().phaseCardHighlight;
    }

    return ThemManager().themColors().phaseCard;
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();
    return Material(
      color: color.background,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0, color: color.outerDivider),
          borderRadius: BorderRadius.circular(radius_x)),
      elevation: elevation_x,
      shadowColor: color.shadowColor,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        onPressed: () {
          _onItemPressed(context);
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: padding_x,
                bottom: padding_2x,
                left: padding_middle,
                right: padding_middle,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              size: icon_size_6x,
                              color: color.icon,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(
                                "${Utils.pb2DateTime(data.phase.endTime).day}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: color.icon,
                                  fontSize: ThemManager().fontSize().normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: padding_middle,
                              right: padding_middle,
                              top: padding_smallest,
                              bottom: padding_smallest),
                          child: Container(
                            width: 0.5,
                            color: color.divider,
                            height: 60,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: _buildPhaseItemTitle(data),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: padding_x),
                              child: data.status ==
                                      pb.CommonStatus.UNKNOWN_COMMON_STATUS
                                  ? null
                                  : Text(
                                      data.status ==
                                              pb.CommonStatus.NOT_STARTED_YET
                                          ? (!Utils.zeroTimestamp(
                                                  data.phase.startTime)
                                              ? MessageManager(context)
                                                  .startAfter(Utils.pb2DateTime(
                                                      data.phase.startTime))
                                              : "未开始")
                                          : MessageManager(context)
                                              .commonStatus(data.status),
                                      style: TextStyle(
                                          color: color.text2,
                                          fontSize:
                                              ThemManager().fontSize().small,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: padding_x),
                          child: Row(
                            children: <Widget>[
                              TimeRange(
                                startTime:
                                    Utils.pb2DateTime(data.phase.startTime),
                                endTime: Utils.pb2DateTime(data.phase.endTime),
                                showIcon: false,
                                fontSize: ThemManager().fontSize().normal,
                                color: color..text = color.text2,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: padding_2x),
                                  child: Text(
                                    _getStatisText(context),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: color.text2,
                                        fontSize:
                                            ThemManager().fontSize().normal,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: archived ? null : _buildMoreButton(context, color),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildMoreButton(BuildContext context, StyleColor color) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(right: padding_x),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius_2x),
          onTap: () {
            showActionSheet(context, moreActions);
          },
          child: Container(
            padding: EdgeInsets.all(padding_smallest),
            child: Icon(
              Icons.more_horiz,
              color: color.icon,
              size: icon_size_4x,
            ),
          ),
        ),
      ),
    );
  }

  _getStatisText(BuildContext context) {
    final ts =
        ", " + MessageManager(context).planOrPhaseTaskStatis(data.taskStatis);

    if (Utils.zeroTimestamp(data.phase.startTime)) {
      return ts;
    }
    return ts +
        ", " +
        MessageManager(context).planOrPhaseDayStatis(
            Utils.pb2DateTime(data.phase.startTime),
            Utils.pb2DateTime(data.phase.endTime),
            data.status);
  }

  _buildPhaseItemTitle(pb.PhaseSummary data) {
    final color = getColor();

    return Text(
      "${data.phase.title}",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          letterSpacing: letter_spacing,
          decoration: data.status == pb.CommonStatus.FINISHED
              ? TextDecoration.lineThrough
              : null,
          decorationThickness: 2,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: color.text2,
          color: data.status == pb.CommonStatus.FINISHED
              ? color.text2
              : color.text,
          fontSize: ThemManager().fontSize().large,
          fontWeight: FontWeight.bold),
    );
  }

  _onItemPressed(BuildContext context) {
    Utils.push(
        context,
        PhasePage(
          archived: archived,
          plan: plan,
          phaseSummary: data,
          onRefresh: onRefresh,
          onDeleted: onDeleted,
        ));
  }
}
