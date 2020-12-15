import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class UnderlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const UnderlineButton({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: ThemManager().fontSize().middle,
            decoration: TextDecoration.underline,
            color: ThemManager().themColors().basic.text),
      ),
    );
  }
}
