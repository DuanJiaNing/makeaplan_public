import 'package:flutter/material.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/utils/utils.dart';

class StatusButtonItem {
  final VoidCallback onPressed;
  final Widget child;

  StatusButtonItem(this.onPressed, this.child);
}

class MAPStatusButton extends StatelessWidget {
  final VoidCallback onMorePressed;
  final pb.CommonStatus status;
  final DateTime startTime;
  final List<StatusButtonItem> statusButtonItems;
  final bool archived;

  const MAPStatusButton({
    Key key,
    this.onMorePressed,
    this.status,
    this.statusButtonItems,
    this.startTime,
    this.archived = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: _buildStatus(context),
          ),
          _buildItem(),
        ],
      ),
    );
  }

  _showStatusText() {
    return status != pb.CommonStatus.UNKNOWN_COMMON_STATUS;
  }

  _buildStatus(BuildContext context) {
    if (!_showStatusText()) {
      return null;
    }

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: padding_2x),
      decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 0.5,
                  color: ThemManager().themColors().cleanButton.divider),
              borderRadius:
                  Utils.emptyList(statusButtonItems) && onMorePressed == null
                      ? BorderRadius.all(Radius.circular(radius_x))
                      : BorderRadius.only(
                          topLeft: Radius.circular(radius_x),
                          bottomLeft: Radius.circular(radius_x),
                        ))),
      child: Text(
        getStatusText(context, status, startTime, archived: archived),
        style: TextStyle(
          color: ThemManager().themColors().cleanButton.text,
          fontSize: ThemManager().fontSize().normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildItem() {
    List<Widget> items = List<Widget>();
    if (!Utils.emptyList(statusButtonItems)) {
      for (var item in statusButtonItems) {
        items.add(GestureDetector(
          onTap: item.onPressed,
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            child: item.child,
          ),
        ));
      }
    }

    if (onMorePressed != null) {
      items.add(Container(
        width: 35,
        child: IconButton(
          onPressed: onMorePressed,
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.more_vert,
            size: icon_size_4x,
            color: ThemManager().themColors().colorfulButton.icon,
          ),
        ),
      ));
    }

    var br = BorderRadius.all(Radius.circular(radius_x));
    if (_showStatusText()) {
      br = BorderRadius.only(
          bottomRight: Radius.circular(radius_x),
          topRight: Radius.circular(radius_x));
    }

    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: br,
          side: BorderSide(
              width: 0.5,
              color: ThemManager().themColors().colorfulButton.divider),
        ),
        color: ThemManager().themColors().colorfulButton.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items,
      ),
    );
  }
}
