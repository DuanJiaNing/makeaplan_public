import 'package:flutter/material.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class GoBackIconButton extends StatelessWidget {
  final VoidCallback onGoBack;

  const GoBackIconButton({
    Key key,
    this.onGoBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onGoBack != null) {
          onGoBack();
        } else {
          Navigator.pop(context);
        }
      },
      icon: Icon(
        IconManager().arrowBack,
        color: ThemManager().themColors().basic.icon,
      ),
    );
  }
}
