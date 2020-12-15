import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';

class FadeIn extends StatelessWidget {
  final Widget child;

  const FadeIn({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(microseconds: 0)),
      builder: (context, snapshot) {
        double op = 1;
        if (snapshot.connectionState == ConnectionState.waiting) {
          op = 0;
        }
        return AnimatedOpacity(
          duration: Duration(milliseconds: duration_milliseconds_std),
          opacity: op,
          child: child,
        );
      },
    );
  }
}
