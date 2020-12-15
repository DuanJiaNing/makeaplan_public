import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class ColorfulButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ColorfulButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.5,
              color: ThemManager().themColors().colorfulButton.divider),
          borderRadius: BorderRadius.circular(radius_x)),
      onPressed: onPressed,
      color: ThemManager().themColors().colorfulButton.background,
      disabledColor: ThemManager().themColors().colorfulButton.disabled,
      elevation: 0,
      highlightElevation: 0,
      child: Text(
        text,
        style: TextStyle(
            color: ThemManager().themColors().colorfulButton.text,
            fontSize: ThemManager().fontSize().large,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
