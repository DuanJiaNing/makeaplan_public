import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeaplan/global.dart';

import 'colors.dart';
import 'font_size.dart';

class ThemManager {
  static const key_them = "app_them";
  int _themMode = them_default;

  static const key_night_on = "night_on";
  bool _darkModeOn = false;
  bool _forceUseLight = false;

  static const key_font_size = "app_font_size";
  int _fontSize = font_size_std;

  ThemeData _themeData;
  static ThemManager _singleton;

  get them => _themeData;

  get themMode => _themMode;

  get fontSizeMode => _fontSize;

  get darkModeOn => _darkModeOn;

  ThemManager._internal();

  factory ThemManager() {
    if (_singleton == null) {
      _singleton = ThemManager._internal();

      _singleton._loadThemMode();
      _singleton._loadFontSize();
      _singleton._buildThemData();
    }
    return _singleton;
  }

  void _loadFontSize() {
    _fontSize = Global.prefs.getInt(key_font_size);
    if (_fontSize == null) {
      _fontSize = font_size_std;
    }
  }

  void _loadThemMode() {
    _themMode = Global.prefs.getInt(key_them);
    if (_themMode == null) {
      _themMode = them_default;
    }

    _darkModeOn = Global.prefs.getBool(key_night_on);
    if (_darkModeOn == null) {
      _darkModeOn = false;
    }
  }

  Brightness getBrightnessForAppBar() {
    if (_forceUseLight || _darkModeOn) {
      return Brightness.dark;
    }

    return Brightness.light;
  }

  setupSystemBar() {
    SystemUiOverlayStyle style = SystemUiOverlayStyle.dark;
    if (_forceUseLight || darkModeOn) {
      style = SystemUiOverlayStyle.light;
    }

    if (Platform.isAndroid) {
      style = style.copyWith(
        statusBarColor: Colors.transparent,
      );
    }

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  void _buildThemData() {
    MAPColor cr = getColorPatten(_themMode);
    _forceUseLight = cr.useLightSystemBar;
    setupSystemBar();

    if (_darkModeOn) {
      print("build dark mode");
      cr = getColorPatten(them_dark);
    }

    _themeData = ThemeData(
//      fontFamily: fontFamily,
      canvasColor: cr.basic.background,
    );
  }

  MAPColor getColorByMode(int tm) {
    return getColorPatten(tm);
  }

  MAPColor themColors() {
    if (_darkModeOn) {
      return getColorPatten(them_dark);
    }

    return getColorPatten(_themMode);
  }

  MAPFontSize fontSize() {
    return getFontSize(_fontSize);
  }

  Future<bool> updateThemMode(BuildContext context, int mode) async {
    final v = await Global.prefs.setInt(key_them, mode);
    _themMode = mode;
    _buildThemData();
    ThemeSwitcher.of(context).changeTheme(theme: them);
    return v;
  }

  Future<bool> updateDarkMode(BuildContext context, bool on) async {
    final v = await Global.prefs.setBool(key_night_on, on);
    _darkModeOn = on;
    _buildThemData();
    ThemeSwitcher.of(context).changeTheme(theme: them);
    return v;
  }

  Future<bool> updateFontSize(BuildContext context, int mode) async {
    final v = await Global.prefs.setInt(key_font_size, mode);
    _fontSize = mode;
    ThemeSwitcher.of(context).changeTheme(theme: them);
    return v;
  }

  MAPFontSize getFontSizeByMode(int m) {
    return getFontSize(m);
  }
}
