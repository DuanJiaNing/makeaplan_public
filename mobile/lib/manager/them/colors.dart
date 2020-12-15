import 'package:flutter/material.dart';

const them_default = 5;
const them_001 = 1;
const them_002 = 2;
const them_dark = 3;
const them_003 = 4;
const them_004 = 6;

MAPColor getColorPatten(int tm) {
  if (tm == them_dark) {
    return _buildDark();
  }

  if (tm == them_001) {
    return _buildColor001();
  }

  if (tm == them_003) {
    return _buildColor003();
  }

  if (tm == them_002) {
    return _buildColor002();
  }

  if (tm == them_004) {
    return _buildColor004();
  }

  return _buildColorDefault();
}

class MAPColor {
  final StyleColor basic;
  final StyleColor toast;
  final StyleColor refreshIndicator;
  final StyleColor settingPanel;
  final bool useLightSystemBar;

  ///
  final StyleColor checkBox;
  final StyleColor checkBoxChecked;

  ///
  final StyleColor bottomNavigationBar;
  final StyleColor bottomNavigationBarMain;
  final StyleColor bottomNavigationBarMainHighlight;

  ///
  final StyleColor planCard;
  final StyleColor archivedPlanCard;
  final StyleColor phaseCard;
  final StyleColor taskCard;
  final StyleColor cardReversedPart;

  ///
  final StyleColor planCardHighlight;
  final StyleColor phaseCardHighlight;
  final StyleColor taskCardHighlight;
  final StyleColor cardReversedPartHighlight;

  ///
  final StyleColor topPanel;
  final StyleColor planIndexPanel;
  final StyleColor dialog;

  ///
  final StyleColor switcher;
  final StyleColor illustration;

  ///
  final StyleColor colorfulButton;
  final StyleColor cleanButton;

  MAPColor({
    this.useLightSystemBar = false,
    this.settingPanel,
    this.dialog,
    this.cardReversedPart,
    this.taskCardHighlight,
    this.cardReversedPartHighlight,
    this.checkBox,
    this.checkBoxChecked,
    this.illustration,
    this.bottomNavigationBarMainHighlight,
    this.colorfulButton,
    this.cleanButton,
    this.basic,
    this.toast,
    this.archivedPlanCard,
    this.refreshIndicator,
    this.bottomNavigationBar,
    this.planCard,
    this.planCardHighlight,
    this.bottomNavigationBarMain,
    this.phaseCard,
    this.phaseCardHighlight,
    this.taskCard,
    this.topPanel,
    this.planIndexPanel,
    this.switcher,
  });
}

class StyleColor {
  Color primary;
  Color icon;
  Color iconFocus;
  Color background;
  Color background2;
  Color text;
  Color text2;
  Color divider;
  Color outerDivider;
  Color warning;
  Color disabled;
  Color shadowColor;

  StyleColor(
      {this.icon = Colors.red,
      this.iconFocus = Colors.red,
      this.background = Colors.red,
      this.background2 = Colors.red,
      this.outerDivider = Colors.red,
      this.text = Colors.red,
      this.divider = Colors.red,
      this.shadowColor = Colors.red,
      this.disabled = Colors.red,
      this.warning = Colors.red,
      this.text2 = Colors.red,
      this.primary = Colors.red});
}

MAPColor _buildColor002() {
  final primary = Color(0xFF03075d);
  final secondaryPrimary = Color(0xFF3525afa);
  final divider = Color(0xFFa6a6a6);
  final mainBg = Color(0xFFf4f5fc);
  final bg2 = Color(0xFFdee0ed);
  final text2 = Color(0xFF808080);
  final text = Colors.black;
  final icon = Colors.black;
  return MAPColor(
    dialog: StyleColor()
      ..background = mainBg
      ..outerDivider = Colors.transparent,
    basic: StyleColor()
      ..outerDivider = divider
      ..shadowColor = Colors.black45
      ..primary = primary
      ..background = mainBg
      ..background2 = bg2
      ..divider = divider
      ..text = text
      ..text2 = text2
      ..icon = icon,
    bottomNavigationBar: StyleColor()
      ..background = primary
      ..icon = secondaryPrimary
      ..iconFocus = Colors.white
      ..text = text,
    bottomNavigationBarMain: StyleColor()
      ..background = secondaryPrimary
      ..divider = Colors.transparent
      ..text = Colors.white30
      ..icon = Colors.white30,
    bottomNavigationBarMainHighlight: StyleColor()
      ..background = Colors.white
      ..divider = Colors.transparent
      ..text = text
      ..icon = primary,
    planCard: StyleColor()
      ..background = Colors.white
      ..primary = primary
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..shadowColor = Colors.black12
      ..text = text
      ..icon = icon
      ..text2 = text2,
    archivedPlanCard: StyleColor()
      ..background = Colors.white
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    planCardHighlight: StyleColor()
      ..background = bg2
      ..primary = primary
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..shadowColor = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    cardReversedPart: StyleColor()
      ..background = primary
      ..text = Colors.white
      ..divider = Colors.transparent,
    cardReversedPartHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = Colors.white,
    illustration: StyleColor()
      ..primary = secondaryPrimary
      ..background = mainBg
      ..background2 = bg2
      ..divider = divider,
    refreshIndicator: StyleColor()
      ..background = primary
      ..icon = Colors.white,
    topPanel: StyleColor()
      ..background = Colors.white
      ..background2 = bg2
      ..text = text
      ..icon = icon
      ..text2 = text2,
    colorfulButton: StyleColor()
      ..background = primary
      ..background2 = Colors.transparent
      ..disabled = primary
      ..divider = Colors.transparent
      ..icon = Colors.white
      ..text = Colors.white,
    planIndexPanel: StyleColor()
      ..divider = divider
      ..outerDivider = divider
      ..background = primary
      ..background2 = secondaryPrimary
      ..text = Colors.white,
    phaseCard: StyleColor()
      ..background = Colors.white
      ..shadowColor = Colors.black12
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    phaseCardHighlight: StyleColor()
      ..background = bg2
      ..shadowColor = Colors.black12
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCard: StyleColor()
      ..background = Colors.white
      ..shadowColor = Colors.black12
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCardHighlight: StyleColor()
      ..background = bg2
      ..shadowColor = Colors.transparent
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    checkBox: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = Colors.transparent,
    checkBoxChecked: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..icon = Colors.white,
    switcher: StyleColor()
      ..background = primary
      ..divider = divider
      ..background2 = bg2,
    cleanButton: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = icon
      ..text = text,
    toast: StyleColor()
      ..background = Colors.black12
      ..text = Colors.black
      ..icon = Colors.black,
    settingPanel: StyleColor()
      ..background = Colors.white
      ..divider = divider
      ..icon = icon
      ..background2 = bg2
      ..text2 = text2
      ..text = text,
  );
}

MAPColor _buildColorDefault() {
  final primary = Color(0xFF3f4685);
  final secondaryPrimary = Color(0xFF909bef);

  final divider = Color(0xFFa6a6a6);

  final mainBg = Color(0xFFf4f5fc);
  final bg2 = Colors.white;
  final bg3 = Color(0xFFe2e6f4);

  final text2 = Colors.black;
  final text = Color(0xFF3f4685);
  final icon = Color(0xFF393939);

  return MAPColor(
    dialog: StyleColor()
      ..background = mainBg
      ..outerDivider = Colors.transparent,
    basic: StyleColor()
      ..outerDivider = divider
      ..shadowColor = Colors.black45
      ..primary = primary
      ..background = mainBg
      ..background2 = bg3
      ..divider = divider
      ..text = text
      ..text2 = text2
      ..icon = icon,
    bottomNavigationBar: StyleColor()
      ..background = mainBg
      ..icon = secondaryPrimary
      ..iconFocus = primary
      ..text = text,
    bottomNavigationBarMain: StyleColor()
      ..background = secondaryPrimary
      ..divider = Colors.transparent
      ..text = Colors.white54
      ..icon = Colors.white54,
    bottomNavigationBarMainHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = Colors.white
      ..icon = bg2,
    planCard: StyleColor()
      ..background = bg2
      ..primary = primary
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..shadowColor = Colors.black12
      ..text = text
      ..icon = icon
      ..text2 = text2,
    archivedPlanCard: StyleColor()
      ..background = bg2
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    planCardHighlight: StyleColor()
      ..background = bg3
      ..primary = primary
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..shadowColor = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    cardReversedPart: StyleColor()
      ..background = primary
      ..text = Colors.white
      ..divider = Colors.transparent,
    cardReversedPartHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = Colors.white,
    illustration: StyleColor()
      ..primary = secondaryPrimary
      ..background = mainBg
      ..background2 = bg3
      ..divider = divider,
    refreshIndicator: StyleColor()
      ..background = primary
      ..icon = Colors.white,
    topPanel: StyleColor()
      ..background = Colors.white
      ..background2 = bg3
      ..text = text
      ..icon = icon
      ..text2 = text2,
    colorfulButton: StyleColor()
      ..background = primary
      ..background2 = Colors.transparent
      ..disabled = primary
      ..divider = Colors.transparent
      ..icon = Colors.white
      ..text = Colors.white,
    planIndexPanel: StyleColor()
      ..divider = divider
      ..outerDivider = divider
      ..background = primary
      ..background2 = secondaryPrimary
      ..text = Colors.white,
    phaseCard: StyleColor()
      ..background = Colors.white
      ..shadowColor = Colors.black12
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    phaseCardHighlight: StyleColor()
      ..background = bg3
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCard: StyleColor()
      ..background = Colors.white
      ..shadowColor = Colors.black12
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCardHighlight: StyleColor()
      ..background = bg3
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    checkBox: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = Colors.transparent,
    checkBoxChecked: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..icon = Colors.white,
    switcher: StyleColor()
      ..background = primary
      ..divider = divider
      ..background2 = bg2,
    cleanButton: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = icon
      ..text = text,
    toast: StyleColor()
      ..background = Colors.black12
      ..text = Colors.black
      ..icon = Colors.black,
    settingPanel: StyleColor()
      ..background = Colors.white
      ..divider = divider
      ..icon = icon
      ..background2 = bg3
      ..text2 = text2
      ..text = text,
  );
}

MAPColor _buildColor004() {
  final primary = Color(0xFFfdbdb1);
  final secondaryPrimary = Color(0xFFfedcd0);

  final divider = primary;

  final mainBg = Color(0xFFfdf0e7);
  final bg2 = Colors.white;
  final bg3 = Color(0xFFfdeae5);

  final text2 = Color(0xFF5f3a3d);
  final text = Color(0xFF301d1e);
  final icon = Color(0xFF452a2c);

  return MAPColor(
    dialog: StyleColor()
      ..background = mainBg
      ..outerDivider = Colors.transparent,
    basic: StyleColor()
      ..outerDivider = divider
      ..shadowColor = Colors.black45
      ..primary = primary
      ..background = mainBg
      ..background2 = secondaryPrimary
      ..divider = divider
      ..text = text
      ..text2 = text2
      ..icon = icon,
    bottomNavigationBar: StyleColor()
      ..background = secondaryPrimary
      ..icon = primary
      ..iconFocus = icon
      ..text = text,
    bottomNavigationBarMain: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = Colors.white54
      ..icon = Colors.white54,
    bottomNavigationBarMainHighlight: StyleColor()
      ..background = text
      ..divider = Colors.transparent
      ..text = Colors.white
      ..icon = primary,
    planCard: StyleColor()
      ..background = bg2
      ..primary = primary
      ..divider = divider
      ..outerDivider = primary
      ..shadowColor = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    archivedPlanCard: StyleColor()
      ..background = bg2
      ..outerDivider = primary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    planCardHighlight: StyleColor()
      ..background = bg3
      ..primary = primary
      ..divider = divider
      ..outerDivider = primary
      ..shadowColor = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    cardReversedPart: StyleColor()
      ..background = primary
      ..text = text
      ..divider = Colors.transparent,
    cardReversedPartHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = text,
    illustration: StyleColor()
      ..primary = primary
      ..background = mainBg
      ..background2 = secondaryPrimary
      ..divider = divider,
    refreshIndicator: StyleColor()
      ..background = primary
      ..icon = icon,
    topPanel: StyleColor()
      ..background = secondaryPrimary
      ..background2 = bg3
      ..text = text
      ..icon = icon
      ..text2 = text2,
    colorfulButton: StyleColor()
      ..background = primary
      ..background2 = Colors.transparent
      ..disabled = primary
      ..divider = primary
      ..icon = icon
      ..text = text,
    planIndexPanel: StyleColor()
      ..divider = divider
      ..outerDivider = primary
      ..background = primary
      ..background2 = bg3
      ..text = text,
    phaseCard: StyleColor()
      ..background = Colors.white
      ..shadowColor = Colors.transparent
      ..outerDivider = divider
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    phaseCardHighlight: StyleColor()
      ..background = bg3
      ..shadowColor = Colors.transparent
      ..outerDivider = divider
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCard: StyleColor()
      ..background = Colors.white
      ..shadowColor = Colors.transparent
      ..outerDivider = primary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCardHighlight: StyleColor()
      ..background = bg3
      ..shadowColor = Colors.transparent
      ..outerDivider = primary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    checkBox: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = Colors.transparent,
    checkBoxChecked: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..icon = Colors.white,
    switcher: StyleColor()
      ..background = primary
      ..divider = divider
      ..background2 = bg2,
    cleanButton: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = icon
      ..text = text,
    toast: StyleColor()
      ..background = Colors.black12
      ..text = Colors.black
      ..icon = Colors.black,
    settingPanel: StyleColor()
      ..background = Colors.white
      ..divider = divider
      ..icon = icon
      ..background2 = bg3
      ..text2 = text2
      ..text = text,
  );
}

MAPColor _buildColor001() {
  final primary = Color(0xFFfddb2a);
  final secondaryPrimary = Color(0xFFfef2b3);
  final divider = Color(0xFF211d2d);
  final mainBg = Colors.white;
  final bg2 = Color(0xFFdee0ed);
  final text2 = Colors.black;
  final text = Colors.black;
  final icon = Color(0xFF211d2d);
  return MAPColor(
    dialog: StyleColor()
      ..background = mainBg
      ..outerDivider = Colors.transparent,
    basic: StyleColor()
      ..shadowColor = Colors.black45
      ..outerDivider = divider
      ..primary = primary
      ..background = mainBg
      ..background2 = bg2
      ..divider = divider
      ..text = text
      ..text2 = text2
      ..icon = icon,
    bottomNavigationBar: StyleColor()
      ..background = icon
      ..icon = Colors.white30
      ..iconFocus = primary
      ..text = text,
    bottomNavigationBarMain: StyleColor()
      ..background = Colors.white30
      ..divider = Colors.transparent
      ..text = text
      ..icon = icon,
    bottomNavigationBarMainHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = text
      ..icon = icon,
    planCard: StyleColor()
      ..background = mainBg
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..divider = divider
      ..outerDivider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    archivedPlanCard: StyleColor()
      ..background = Colors.transparent
      ..outerDivider = divider
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    planCardHighlight: StyleColor()
      ..background = primary
      ..primary = Colors.white
      ..divider = divider
      ..outerDivider = divider
      ..shadowColor = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    cardReversedPart: StyleColor()
      ..background = primary
      ..text = text
      ..divider = Colors.transparent,
    cardReversedPartHighlight: StyleColor()
      ..background = Colors.white
      ..divider = divider
      ..text = text,
    illustration: StyleColor()
      ..primary = secondaryPrimary
      ..background = mainBg
      ..background2 = bg2
      ..divider = divider,
    refreshIndicator: StyleColor()
      ..background = primary
      ..icon = text,
    topPanel: StyleColor()
      ..background = Colors.white
      ..background2 = bg2
      ..text = text
      ..icon = icon
      ..text2 = text2,
    colorfulButton: StyleColor()
      ..background = primary
      ..background2 = Colors.transparent
      ..disabled = primary
      ..divider = divider
      ..icon = icon
      ..text = text,
    planIndexPanel: StyleColor()
      ..background = primary
      ..outerDivider = divider
      ..divider = divider
      ..background2 = secondaryPrimary
      ..text = text,
    phaseCard: StyleColor()
      ..background = mainBg
      ..shadowColor = Colors.transparent
      ..outerDivider = divider
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    phaseCardHighlight: StyleColor()
      ..background = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = divider
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCard: StyleColor()
      ..background = mainBg
      ..divider = divider
      ..shadowColor = Colors.transparent
      ..outerDivider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCardHighlight: StyleColor()
      ..background = Colors.white
      ..divider = divider
      ..shadowColor = Colors.transparent
      ..outerDivider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    checkBox: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = Colors.transparent,
    checkBoxChecked: StyleColor()
      ..background = primary
      ..divider = divider
      ..icon = icon,
    switcher: StyleColor()
      ..background = primary
      ..divider = divider
      ..background2 = bg2,
    cleanButton: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = icon
      ..text = text,
    toast: StyleColor()
      ..background = Colors.black12
      ..text = Colors.black
      ..icon = Colors.black,
    settingPanel: StyleColor()
      ..text = text
      ..divider = divider
      ..icon = icon
      ..background2 = bg2
      ..text2 = text2
      ..background = Colors.transparent,
  );
}

MAPColor _buildColor003() {
  final mainBg = Color(0xFFe1e9f3);
  final bg2 = Color(0xFFedf2f8);
  final primary = Color(0xFFbb6374);
  final secondaryPrimary = Color(0xFFd194a0);
  final bg3 = Color(0xFFc8d7e9);

  final text = Color(0xFF4a5671);
  final text2 = Color(0xFF7f879a);
  final icon = Color(0xFF646c7f);
  final divider = Color(0xFF646c7f);

  return MAPColor(
    dialog: StyleColor()
      ..background = mainBg
      ..outerDivider = Colors.transparent,
    useLightSystemBar: false,
    basic: StyleColor()
      ..primary = primary
      ..outerDivider = divider
      ..shadowColor = primary
      ..background = mainBg
      ..background2 = bg2
      ..divider = divider
      ..text = text
      ..text2 = text2
      ..icon = icon,
    bottomNavigationBar: StyleColor()
      ..background = bg2
      ..icon = icon
      ..iconFocus = primary
      ..text = text,
    bottomNavigationBarMain: StyleColor()
      ..background = bg3
      ..divider = Colors.transparent
      ..text = Colors.white
      ..icon = bg2,
    bottomNavigationBarMainHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = mainBg
      ..icon = bg2,
    planCard: StyleColor()
      ..background = bg2
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    archivedPlanCard: StyleColor()
      ..background = bg2
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    planCardHighlight: StyleColor()
      ..background = bg3
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    cardReversedPart: StyleColor()
      ..background = primary
      ..text = mainBg
      ..divider = primary,
    cardReversedPartHighlight: StyleColor()
      ..background = primary
      ..text = mainBg
      ..divider = primary,
    illustration: StyleColor()
      ..primary = secondaryPrimary
      ..background = mainBg
      ..background2 = bg3
      ..divider = divider,
    refreshIndicator: StyleColor()
      ..background = primary
      ..icon = Colors.black,
    topPanel: StyleColor()
      ..background = bg2
      ..background2 = bg3
      ..text = text
      ..icon = icon
      ..text2 = text2,
    colorfulButton: StyleColor()
      ..background = primary
      ..background2 = Colors.transparent
      ..disabled = primary
      ..divider = secondaryPrimary
      ..icon = mainBg
      ..text = mainBg,
    planIndexPanel: StyleColor()
      ..background = primary
      ..divider = divider
      ..outerDivider = divider
      ..background2 = secondaryPrimary
      ..text = Colors.black,
    phaseCard: StyleColor()
      ..background = bg2
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    phaseCardHighlight: StyleColor()
      ..background = bg3
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCard: StyleColor()
      ..background = bg2
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCardHighlight: StyleColor()
      ..background = bg3
      ..primary = primary
      ..shadowColor = Colors.transparent
      ..outerDivider = Colors.transparent
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    checkBox: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = Colors.transparent,
    checkBoxChecked: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..icon = mainBg,
    switcher: StyleColor()
      ..background = primary
      ..divider = secondaryPrimary
      ..background2 = bg2,
    cleanButton: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = icon
      ..text = text,
    toast: StyleColor()
      ..background = Colors.black26
      ..text = Colors.white
      ..icon = Colors.white,
    settingPanel: StyleColor()
      ..background = bg2
      ..text = text
      ..text2 = text2
      ..divider = divider
      ..icon = icon
      ..background2 = bg3,
  );
}

MAPColor _buildDark() {
  final mainBg = Colors.black;
  final bg2 = Color(0xFF0d0d0d);
  final primary = Color(0xFFd12e28);
  final secondaryPrimary = Color(0xFF6ab9bc);
  final bg3 = Colors.white24;

  final text = Colors.white70;
  final text2 = Colors.white30;
  final icon = Colors.white38;
  final divider = Colors.white38;

  return MAPColor(
    dialog: StyleColor()
      ..background = Color(0xFF1a1a1a)
      ..outerDivider = Colors.transparent,
    basic: StyleColor()
      ..outerDivider = divider
      ..primary = primary
      ..shadowColor = primary
      ..background = mainBg
      ..background2 = bg2
      ..divider = divider
      ..text = text
      ..text2 = text2
      ..icon = icon,
    bottomNavigationBar: StyleColor()
      ..background = mainBg
      ..icon = icon
      ..iconFocus = Colors.white
      ..text = text,
    bottomNavigationBarMain: StyleColor()
      ..background = bg3
      ..divider = Colors.transparent
      ..text = text2
      ..icon = icon,
    bottomNavigationBarMainHighlight: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..text = text
      ..icon = icon,
    planCard: StyleColor()
      ..background = bg2
      ..primary = secondaryPrimary
      ..shadowColor = Colors.transparent
      ..outerDivider = secondaryPrimary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    archivedPlanCard: StyleColor()
      ..background = bg2
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    planCardHighlight: StyleColor()
      ..background = bg2
      ..shadowColor = Colors.transparent
      ..primary = secondaryPrimary
      ..outerDivider = secondaryPrimary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    cardReversedPart: StyleColor()
      ..background = Colors.transparent
      ..text = text2
      ..divider = divider,
    cardReversedPartHighlight: StyleColor()
      ..background = Colors.transparent
      ..text = text2
      ..divider = divider,
    illustration: StyleColor()
      ..primary = secondaryPrimary
      ..background = mainBg
      ..background2 = primary
      ..divider = secondaryPrimary,
    refreshIndicator: StyleColor()
      ..background = primary
      ..icon = Colors.black,
    topPanel: StyleColor()
      ..background = bg2
      ..background2 = bg3
      ..text = text
      ..icon = icon
      ..text2 = text2,
    colorfulButton: StyleColor()
      ..background = bg2
      ..background2 = Colors.red
      ..disabled = primary
      ..divider = secondaryPrimary
      ..icon = secondaryPrimary
      ..text = secondaryPrimary,
    planIndexPanel: StyleColor()
      ..background = primary
      ..divider = divider
      ..outerDivider = Colors.transparent
      ..background2 = secondaryPrimary
      ..text = Colors.black87,
    phaseCard: StyleColor()
      ..background = bg2
      ..divider = divider
      ..outerDivider = secondaryPrimary
      ..shadowColor = Colors.transparent
      ..text = text
      ..icon = icon
      ..text2 = text2,
    phaseCardHighlight: StyleColor()
      ..background = bg2
      ..shadowColor = Colors.transparent
      ..outerDivider = secondaryPrimary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCard: StyleColor()
      ..background = bg2
      ..shadowColor = Colors.transparent
      ..outerDivider = secondaryPrimary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    taskCardHighlight: StyleColor()
      ..background = bg2
      ..shadowColor = Colors.transparent
      ..outerDivider = secondaryPrimary
      ..divider = divider
      ..text = text
      ..icon = icon
      ..text2 = text2,
    checkBox: StyleColor()
      ..background = Colors.transparent
      ..divider = divider
      ..icon = Colors.transparent,
    checkBoxChecked: StyleColor()
      ..background = primary
      ..divider = Colors.transparent
      ..icon = text,
    switcher: StyleColor()
      ..background = primary
      ..divider = secondaryPrimary
      ..background2 = bg2,
    cleanButton: StyleColor()
      ..background = Colors.transparent
      ..divider = secondaryPrimary
      ..icon = icon
      ..text = text,
    toast: StyleColor()
      ..background = Colors.white12
      ..text = Colors.white
      ..icon = Colors.white,
    settingPanel: StyleColor()
      ..background = bg2
      ..text = text
      ..text2 = text2
      ..divider = divider
      ..icon = icon
      ..background2 = bg3,
  );
}
