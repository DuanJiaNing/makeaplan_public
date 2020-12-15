import 'package:flutter/material.dart';

const en_US = 0;
const zh_CN = 1;

class I10nManager {
  int _local;

  I10nManager(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    _local = myLocale.languageCode == "zh" ? zh_CN : en_US;
  }

  bool isInCN(){
    return _local == zh_CN;
  }
}