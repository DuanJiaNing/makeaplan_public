import 'package:makeaplan/manager/preference/preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;

  static Future<bool> firstInit() async {
    final co = _prefs.getInt("start_count");
    var nc = 1;
    if (co != null) {
      nc = nc + 1;
    }
    await _prefs.setInt("start_count", nc);
    return nc == 1;
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    await PreferenceManager().initDeviceId();
  }

  static SharedPreferences get prefs => _prefs;
}
