import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: ThemManager().themColors().basic.text,
          fontSize: ThemManager().fontSize().largest,
          fontWeight: FontWeight.normal),
    );
  }
}
