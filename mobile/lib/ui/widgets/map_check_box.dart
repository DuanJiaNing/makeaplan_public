import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class MAPCheckBox extends StatelessWidget {
  final bool checked;
  final ValueChanged<bool> onChanged;

  const MAPCheckBox({Key key, this.checked = false, this.onChanged})
      : super(key: key);

  StyleColor getColor() {
    return !checked
        ? ThemManager().themColors().checkBox
        : ThemManager().themColors().checkBoxChecked;
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();
    return InkWell(
      borderRadius: BorderRadius.circular(radius_3x),
      onTap: () {
        if (onChanged != null) {
          onChanged(!checked);
        }
      },
      child: Container(
        child: Container(
          decoration: ShapeDecoration(
              color: color.background,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: color.divider),
                  borderRadius: BorderRadius.circular(radius_smallest))),
          child: Icon(
            Icons.check,
            color: color.icon,
          ),
        ),
      ),
    );
  }
}
