import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makeaplan/api/google/protobuf/timestamp.pb.dart' as pb;
import 'package:makeaplan/api/google/protobuf/wrappers.pb.dart' as pb;

class DaysStatis {
  final int passed;
  final int total;

  DaysStatis({this.passed = 0, this.total = 0});
}

class Utils {
  static bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  static DaysStatis daysStatis(DateTime startTime, DateTime endTime) {
    int total;
    if (!zeroDateTime(startTime) && !zeroDateTime(endTime)) {
      total = endTime.difference(startTime).inDays + 1;
    }

    int passed;
    final pd = DateTime.now().difference(startTime);
    final passedSec = pd.inSeconds;
    var passedDay = pd.inDays;
    if (passedSec < 0) {
      passed = passedDay - 1;
    } else {
      passed = passedDay + 1;
    }

    return DaysStatis(total: total, passed: passed);
  }

  static bool verifyEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);
  }

  static bool verifyPhone(String phone) {
    return RegExp(r"^\d{3,15}$").hasMatch(phone);
  }

  static final DateFormat formatter = DateFormat('yyyy MM-dd');
  static final DateFormat formatterWithTime = DateFormat('yyyy MM-dd HH:mm');

  static String formatDate(DateTime date) {
    return formatter.format(date);
  }

  static String formatDateWithTime(DateTime date) {
    return formatterWithTime.format(date);
  }

  static Future<dynamic> push(BuildContext context, Widget page) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => page),
        (route) => route == null);
  }

  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static DateTime pb2DateTime(pb.Timestamp ts) {
    final d = ts.toDateTime().toLocal();
    return zeroDateTime(d) ? null : d;
  }

  static bool zeroTimestamp(pb.Timestamp ts) {
    return ts == null || ts.toDateTime().year == 1970;
  }

  static bool zeroDateTime(DateTime dt) {
    return dt == null || dt.year == 1970;
  }

  static pb.Timestamp dateTime2Pb(DateTime dt) {
    return pb.Timestamp.fromDateTime(dt);
  }

  static pb.Int32Value pbInt32(int value) {
    return pb.Int32Value.create()..value = value;
  }

  static pb.StringValue pbString(String value) {
    return pb.StringValue.create()..value = value;
  }

  static DateTime minimumSelectableDate() {
    return DateTime.now().subtract(Duration(days: 365 * 5));
  }

  static DateTime maximumSelectableDate() {
    return DateTime.now().add(Duration(days: 365 * 5));
  }

  static String colorAsString(Color color) {
    var red = "${color.red.toRadixString(16)}";
    red = red.length == 1 ? "0$red" : red;
    var green = "${color.green.toRadixString(16)}";
    green = green.length == 1 ? "0$green" : green;
    var blue = "${color.blue.toRadixString(16)}";
    blue = blue.length == 1 ? "0$blue" : blue;

    return "#$red$green$blue";
  }

  static bool emptyList(List list) {
    return list == null || list.length == 0;
  }

  static bool emptyString(String str) {
    return str == null || str.trim().length == 0;
  }

  static bool inOneDay(DateTime startTime, endTime) {
    if (Utils.zeroDateTime(startTime) || Utils.zeroDateTime(endTime)) {
      return false;
    }

    return startTime.year == endTime.year &&
        startTime.month == endTime.month &&
        startTime.day == endTime.day;
  }

  static bool bothZeroTime(DateTime startTime, endTime) {
    return Utils.zeroDateTime(startTime) && Utils.zeroDateTime(endTime);
  }
}
