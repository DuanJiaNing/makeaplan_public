import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

class InProgressOffstage extends StatelessWidget {
  final bool inProgress;
  final VoidCallback onComplete;

  const InProgressOffstage({Key key, this.inProgress, this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !inProgress,
      child: AnimatedOpacity(
        onEnd: () {
          if (!inProgress) {
            if (onComplete != null) {
              onComplete();
            }
          }
        },
        opacity: inProgress ? 0.7 : 0.0,
        duration: Duration(milliseconds: duration_milliseconds_std),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: ThemManager().themColors().basic.background,
        ),
      ),
    );
  }
}
