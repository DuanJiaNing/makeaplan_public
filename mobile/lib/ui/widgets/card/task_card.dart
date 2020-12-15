import 'package:flutter/material.dart';
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/map_check_box.dart';
import 'package:makeaplan/utils/utils.dart';

class TaskCard extends StatelessWidget {
  final pb.Task data;
  final ValueChanged<bool> onChanged;
  final List<SheetAction> moreActions;
  final bool archived;

  const TaskCard({
    Key key,
    this.data,
    this.onChanged,
    this.moreActions,
    this.archived = false,
  }) : super(key: key);

  StyleColor getColor() {
    return data.checked
        ? ThemManager().themColors().taskCardHighlight
        : ThemManager().themColors().taskCard;
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();
    return GestureDetector(
      child: Material(
        elevation: elevation_x,
        shadowColor: color.shadowColor,
        color: color.background,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5, color: color.outerDivider),
            borderRadius: BorderRadius.circular(radius_x)),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: padding_x,
                bottom: padding_2x,
                left: padding_2x,
                right: padding_middle,
              ),
              child: _buildContent(context),
            ),
            Container(
              child: archived ? null : _buildMore(context, color),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildMore(BuildContext context, StyleColor color) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(right: padding_x),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius_2x),
          onTap: () {
            showActionSheet(
              context,
              moreActions,
            );
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

  _buildContent(BuildContext context) {
    final color = getColor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildLeft(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              Container(
                height: padding_x,
              ),
              Container(
                child: Utils.bothZeroTime(Utils.pb2DateTime(data.startTime),
                        Utils.pb2DateTime(data.endTime))
                    ? null
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              MessageManager(context).timeRange(
                                Utils.pb2DateTime(data.startTime),
                                Utils.pb2DateTime(data.endTime),
                                displayAsTime: true,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: color.text2,
                                  fontSize: ThemManager().fontSize().normal,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            child: _bothNonZeroTimeAndNotEqual()
                                ? _buildSpendHour(context)
                                : null,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _buildTitle() {
    final color = getColor();
    return Text(
      data.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: data.checked ? TextDecoration.lineThrough : null,
        color: data.checked ? color.text2 : color.text,
        fontSize: ThemManager().fontSize().large,
        fontWeight: FontWeight.bold,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: color.text2,
      ),
    );
  }

  Container _buildLeft() {
    final color = getColor();
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: MAPCheckBox(
              checked: data.checked,
              onChanged: archived ? null : onChanged,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: padding_middle,
                left: padding_2x,
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
    );
  }

  _buildSpendHour(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: padding_x),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding_x, vertical: 2),
        decoration: ShapeDecoration(
            color: ThemManager().themColors().cardReversedPart.background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_smallest))),
        child: Text(
          MessageManager(context).displayTimeDuration(
              Utils.pb2DateTime(data.startTime),
              Utils.pb2DateTime(data.endTime)),
          style: TextStyle(
            color: ThemManager().themColors().cardReversedPart.text,
            fontSize: ThemManager().fontSize().small,
          ),
        ),
      ),
    );
  }

  _bothNonZeroTimeAndNotEqual() {
    if (!Utils.zeroTimestamp(data.startTime) &&
        !Utils.zeroTimestamp(data.endTime)) {
      final st = Utils.pb2DateTime(data.startTime);
      final et = Utils.pb2DateTime(data.endTime);
      if (!(st.year == et.year &&
          st.month == et.month &&
          st.day == et.day &&
          st.hour == et.hour &&
          st.minute == et.minute)) {
        return true;
      }
    }

    return false;
  }
}
