import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class SmallOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SmallOutlineButton({Key key, this.onPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: padding_smallest, horizontal: padding_2x),
        decoration: ShapeDecoration(
            color: ThemManager().themColors().cleanButton.background,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ThemManager().themColors().cleanButton.divider,
                  width: 0.5,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(radius_smallest)))),
        child: Text(
          text,
          style: TextStyle(
            color: ThemManager().themColors().cleanButton.text,
            fontSize: ThemManager().fontSize().small,
          ),
        ),
      ),
    );
  }
}
