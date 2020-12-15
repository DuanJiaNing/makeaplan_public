import 'package:flutter/material.dart';

class IconManager {
  static IconManager _singleton;

  IconManager._internal();

  factory IconManager() {
    if (_singleton == null) {
      _singleton = IconManager._internal();
    }
    return _singleton;
  }

  IconData get check => Icons.check;

  IconData get close => Icons.close;

  IconData get arrowRight => Icons.keyboard_arrow_right;

  IconData get arrowLeft => Icons.keyboard_arrow_left;

  IconData get arrowBack => Icons.arrow_back_ios;

  IconData get visibilityOff => Icons.visibility_off;

  IconData get visibility => Icons.visibility;

  IconData get cameraAlt => Icons.camera_alt;

  IconData get accessTime => Icons.access_time;

  String get calendarTodoLine => 'assets/icons/calendar-todo-line.svg';

  String get footprintLine => 'assets/icons/footprint-line.svg';

  String get user3Line => 'assets/icons/user-3-line.svg';

  String get calendarLine => 'assets/icons/calendar-line.svg';

  String get timeLine => 'assets/icons/time-line.svg';

  String get flag2Line => 'assets/icons/flag-2-line.svg';

  String get attachment2 => 'assets/icons/attachment-2.svg';

  String get arrowDownSFill => 'assets/icons/arrow-down-s-fill.svg';

  String get doubleArrowDown =>
      'assets/icons/navigate-arrows-pointing-to-down.svg';
}
