import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class MAPSwitcher extends StatelessWidget {
  final bool on;
  final ValueChanged onChanged;

  const MAPSwitcher({Key key, this.on = false, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemManager().themColors().switcher.divider,
      ),
      child: CupertinoSwitch(
        activeColor: ThemManager().themColors().switcher.background,
        trackColor: ThemManager().themColors().switcher.background2,
        value: on,
        onChanged: onChanged,
      ),
    );
  }
}
