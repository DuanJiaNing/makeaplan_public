import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';

class MAPBottomSheet extends StatelessWidget {
  final Widget content;
  final Widget topBar;
  final double height;

  const MAPBottomSheet(
      {Key key, this.content, this.topBar, this.height = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        maxHeight: height,
      ),
      child: buildSheet(),
    );
  }

  buildSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: padding_2x,bottom: padding_2x),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                  color: ThemManager().themColors().basic.divider,
                  borderRadius: BorderRadius.all(Radius.circular(radius_x))),
            ),
          ),
        ),
        Container(
          child: topBar == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(left: padding_3x, right: padding_2x),
                  child: topBar,
                ),
        ),
        Expanded(child: content),
      ],
    );
  }
}
