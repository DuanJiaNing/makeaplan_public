import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class RoundedOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RoundedOutlineButton({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius_x),
        side: BorderSide(
          color: ThemManager().themColors().cleanButton.divider,
          width: 0.5,
        ),
      ),
      elevation: 0,
      highlightElevation: 0,
      child: Text(
        title,
        style: TextStyle(
            color: ThemManager().themColors().cleanButton.text,
            fontSize: ThemManager().fontSize().large,
            fontWeight: FontWeight.normal),
      ),
      onPressed: onPressed,
    );
  }
}
