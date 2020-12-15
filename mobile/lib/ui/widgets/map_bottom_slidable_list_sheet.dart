import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MAPSlidableListBottomSheet extends StatelessWidget {
  final List<Widget> content;
  final Widget topBar;
  final double height;
  final bool dragUpEnable;

  const MAPSlidableListBottomSheet(
      {Key key,
      this.content,
      this.topBar,
      this.height,
      this.dragUpEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minHeight = height ?? MediaQuery.of(context).size.height / 2;
    return SlidingUpPanel(
      color: ThemManager().themColors().dialog.background,
      minHeight: minHeight,
      maxHeight:
          dragUpEnable ? MediaQuery.of(context).size.height - 60 : minHeight,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius_2x),
          topRight: Radius.circular(radius_2x)),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      panelBuilder: (scrollController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: padding_2x),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                      color: ThemManager().themColors().basic.divider,
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius_x))),
                ),
              ),
            ),
            Container(
              child: topBar == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(
                          top: padding_3x, left: padding_3x, right: padding_3x),
                      child: topBar,
                    ),
            ),
            Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: content.length,
                    itemBuilder: (context, index) {
                      return content[index];
                    })),
          ],
        );
      },
    );
  }
}
