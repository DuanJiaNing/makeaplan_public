import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';

class MAPProgressIndicator extends StatelessWidget {
  final bool rounded;
  final Widget content;
  final double height;
  final double innerLineHeight;
  final Color backgroundColor;
  final Color color;
  final Color dividerColor;
  final Color innerLineColor;

  const MAPProgressIndicator({
    Key key,
    @required this.value,
    this.rounded = true,
    this.content,
    this.height,
    this.innerLineHeight,
    this.backgroundColor,
    this.color,
    this.innerLineColor,
    this.dividerColor,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius_2x)),
            side: BorderSide(
              width: 0.5,
              color: dividerColor,
            )),
      ),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: (value * 100).round(),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(radius_2x)),
                  ),
                ),
              ),
              Expanded(
                flex: ((1 - value) * 100).round(),
                child: Container(
                  height: innerLineHeight,
                  color: innerLineColor,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: padding_3x),
            child: content,
          ),
        ],
      ),
    );
  }
}
