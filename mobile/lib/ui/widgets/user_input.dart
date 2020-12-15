import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class UserInput extends StatelessWidget {
  final bool obscureText;
  final IconButton suffixIcon;
  final Widget prefix;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final TextEditingController controller;
  final BorderRadius borderRadius;
  final int lines;

  const UserInput({
    Key key,
    this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.prefix,
    this.keyboardType,
    this.focusNode,
    this.controller,
    this.borderRadius,
    this.lines = 1,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    final br = borderRadius ?? BorderRadius.circular(radius_x);
    return Scrollbar(
      child: TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          cursorColor: ThemManager().themColors().basic.primary,
          keyboardType: keyboardType,
          maxLines: lines,
          minLines: lines,
          style: TextStyle(
              color: ThemManager().themColors().basic.text,
              fontSize: ThemManager().fontSize().large),
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefix: prefix,
              focusedBorder: OutlineInputBorder(
                  borderRadius: br,
                  borderSide: BorderSide(
                      color: ThemManager().themColors().basic.primary,
                      width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: br,
                  borderSide: BorderSide(
                      color: ThemManager().themColors().basic.divider)),
              contentPadding: EdgeInsets.all(padding_2x),
              hintText: hint,
              hintStyle: TextStyle(
                  color: ThemManager().themColors().basic.text2,
                  fontSize: ThemManager().fontSize().middle))),
    );
  }
}
