import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class RoundedIconTextButton extends StatelessWidget {
  final double height;
  final String text;
  final VoidCallback onPressed;
  final bool showLeadingAddIcon;
  final Widget leading;
  final Widget tail;

  const RoundedIconTextButton(
      {Key key,
      this.height = 60,
      this.onPressed,
      this.text,
      this.showLeadingAddIcon = true,
      this.leading,
      this.tail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius_x),
        side: BorderSide(width: 0.5, color: ThemManager().themColors().colorfulButton.divider),
      ),
      color: ThemManager().themColors().colorfulButton.background,
      elevation: 0,
      highlightElevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: leading,
              ),
              Container(
                child: showLeadingAddIcon
                    ? Icon(
                        Icons.add,
                        color: ThemManager().themColors().colorfulButton.icon,
                        size: icon_size_5x,
                      )
                    : null,
              ),
              Container(
                width: padding_2x,
              ),
              Text(
                text,
                style: TextStyle(
                    color: ThemManager().themColors().colorfulButton.text,
                    fontSize: ThemManager().fontSize().middle,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          Container(
            child: tail,
          )
        ],
      ),
    );
  }
}
