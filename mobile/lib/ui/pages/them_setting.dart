import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';

class ThemSettingPage extends StatefulWidget {
  @override
  _FontSizeSettingPageState createState() => _FontSizeSettingPageState();
}

class _FontSizeSettingPageState extends State<ThemSettingPage> {
  bool _modified = false;
  int _selectedMode;
  int _oldSelectedMode;

  @override
  void initState() {
    super.initState();

    _oldSelectedMode = ThemManager().themMode;
    _selectedMode = _oldSelectedMode;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (ctx) {
        return Scaffold(
          appBar: buildSavableAppBar(MessageManager(context).selectTheme,
              onSavePressed: _modified
                  ? () {
                      _onSave(ctx);
                    }
                  : null),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: padding_2x, vertical: padding_4x),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    child: _buildPreview(),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: padding_4x),
                    child: _buildSelector(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSelector() {
    return Wrap(
      spacing: padding_middle,
      runSpacing: padding_x,
      children: <Widget>[
        _buildSelectorItem(them_default),
        _buildSelectorItem(them_001),
        _buildSelectorItem(them_002),
        _buildSelectorItem(them_004),
        _buildSelectorItem(them_003),
      ],
    );
  }

  _buildSelectorItem(int tm) {
    final text = MessageManager(context).colorTheme(tm);
    return FlatButton(
      padding: EdgeInsets.all(0),
      color: _selectedMode == tm
          ? ThemManager().themColors().basic.background2
          : ThemManager().themColors().basic.background,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.5, color: ThemManager().themColors().basic.divider),
          borderRadius: BorderRadius.circular(radius_2x)),
      onPressed: () {
        _update(tm);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding_x, vertical: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildThemStub(tm),
            Container(
              padding:
                  EdgeInsets.only(right: padding_2x, left: padding_smallest),
              child: Text(
                text,
                style: TextStyle(
                  color: ThemManager().themColors().basic.text,
                  fontSize: ThemManager().fontSize().middle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPreview() {
    final color = ThemManager().getColorByMode(_selectedMode);
    final width = 230.0;
    return Material(
      elevation: elevation_x,
      shadowColor: color.basic.primary,
      color: color.basic.background,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.5, color: ThemManager().themColors().basic.outerDivider),
          borderRadius: BorderRadius.circular(radius_2x)),
      child: Container(
        width: width,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: color.topPanel.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius_2x),
                      topRight: Radius.circular(radius_2x),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: padding_2x,
                    right: padding_2x,
                    top: padding_3x,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: padding_8x),
                        child: Container(
                          height: 15,
                          color: color.topPanel.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: padding_x),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: color.planIndexPanel.background,
                            borderRadius: BorderRadius.all(
                                Radius.circular(radius_smallest)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: padding_x, bottom: padding_x),
                        child: Container(
                          height: 10,
                          width: 50,
                          color: color.topPanel.text2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.only(
                    left: padding_2x,
                    right: padding_2x,
                    top: padding_2x,
                  ),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: color.planCard.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.5,
                          color: color.planCard.outerDivider,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius_x)),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: padding_x, vertical: padding_x),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 25,
                            decoration: ShapeDecoration(
                              color: color.cardReversedPart.background,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.5,
                                  color: color.cardReversedPart.divider,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(radius_smallest)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.only(left: padding_x),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 50,
                                  color: color.planCard.text,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_x),
                                  child: Container(
                                    height: 15,
                                    color: color.planCard.text2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.only(left: padding_x),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 25,
                                  color: color.planCard.text2,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_x),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    color: color.planCard.icon,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.only(
                    left: padding_2x,
                    right: padding_2x,
                    top: padding_2x,
                  ),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: color.planCardHighlight.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.5,
                          color: color.planCardHighlight.outerDivider,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius_x)),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: padding_x, vertical: padding_x),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 25,
                            decoration: ShapeDecoration(
                              color: color.cardReversedPartHighlight.background,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.5,
                                  color:
                                      color.cardReversedPartHighlight.divider,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(radius_smallest)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.only(left: padding_x),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 50,
                                  color: color.planCardHighlight.text,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_x),
                                  child: Container(
                                    height: 15,
                                    color: color.planCardHighlight.text2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.only(left: padding_x),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 25,
                                  color: color.planCardHighlight.text2,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_x),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    color: color.planCardHighlight.icon,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  padding: EdgeInsets.only(
                    left: padding_2x,
                    right: padding_2x,
                    top: padding_2x,
                  ),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: color.planCard.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.5,
                          color: color.planCard.outerDivider,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius_x)),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: padding_x, vertical: padding_x),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 25,
                            decoration: ShapeDecoration(
                              color: color.cardReversedPart.background,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.5,
                                  color: color.cardReversedPart.divider,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(radius_smallest)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.only(left: padding_x),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 50,
                                  color: color.planCard.text,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_x),
                                  child: Container(
                                    height: 15,
                                    color: color.planCard.text2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_middle),
                                  child: Container(
                                    height: 6,
                                    width: 80,
                                    color: color.planCard.text2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Container(
                                    height: 6,
                                    width: 100,
                                    color: color.planCard.text2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Container(
                                    height: 6,
                                    width: 40,
                                    color: color.planCard.text2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.only(left: padding_x),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 25,
                                  color: color.planCard.text2,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: padding_x),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    color: color.planCard.icon,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: padding_10x,
                ),
              ],
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: color.bottomNavigationBar.background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius_2x),
                    bottomRight: Radius.circular(radius_2x),
                  ),
                ),
                width: width,
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: padding_x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(padding_middle),
                      decoration: ShapeDecoration(
                          color: color.bottomNavigationBar.icon,
                          shape: CircleBorder()),
                    ),
                    Container(
                      padding: EdgeInsets.all(padding_middle),
                      decoration: ShapeDecoration(
                          color: color.bottomNavigationBar.iconFocus,
                          shape: CircleBorder()),
                    ),
                    Container(
                      padding: EdgeInsets.all(padding_middle),
                      decoration: ShapeDecoration(
                          color: color.bottomNavigationBar.icon,
                          shape: CircleBorder()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSave(BuildContext context) async {
    await ThemManager().updateThemMode(context, _selectedMode);
    showToast(context, MessageManager(context).applied);
    setState(() {
      _modified = false;
      _oldSelectedMode = _selectedMode;
    });
  }

  _update(int nm) {
    setState(() {
      _modified = _oldSelectedMode != nm;
      _selectedMode = nm;
    });
  }
}
