import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';

class CardStatisItem extends StatelessWidget {
  final bool leadingDivider;
  final String text;
  final StyleColor color;
  final double fontSize;

  const CardStatisItem(
      {Key key,
      this.color,
      this.leadingDivider = true,
      this.text,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: leadingDivider
              ? Padding(
                  padding: EdgeInsets.only(
                      left: padding_smallest, right: padding_smallest),
                  child: Container(
                    height: 12,
                    width: 1,
                    color: color.divider,
                  ),
                )
              : null,
        ),
        Text(
          text,
          style: TextStyle(
              color: color.text2,
              fontSize: fontSize,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
