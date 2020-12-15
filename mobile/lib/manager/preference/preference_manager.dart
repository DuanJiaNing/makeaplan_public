import 'package:flutter_udid/flutter_udid.dart';
import 'package:makeaplan/global.dart';
import 'package:makeaplan/utils/utils.dart';

class PreferenceManager {
  static const index_panel_open_hide_key = "index_panel_open_hide_key";
  static const device_id_key = "device_id_key";

  static PreferenceManager _singleton;

  String _deviceId;

  get deviceId => _deviceId;

  PreferenceManager._internal();

  factory PreferenceManager() {
    if (_singleton == null) {
      _singleton = PreferenceManager._internal();
    }
    return _singleton;
  }

  updateIndexPanelStatus(bool show) async {
    await Global.prefs.setBool(index_panel_open_hide_key, show);
  }

  /// true if show.
  bool indexPanelStatus() {
    return Global.prefs.getBool(index_panel_open_hide_key);
  }

  initDeviceId() async {
    if (!Utils.emptyString(_deviceId)) {
      print("DID: $_deviceId");
      return;
    }
    _deviceId = Global.prefs.getString(device_id_key);
    if (!Utils.emptyString(_deviceId)) {
      print("DID in prefs: $_deviceId");
      return;
    }

    _deviceId = await FlutterUdid.udid;
    print("init deviceId: $_deviceId");

    await Global.prefs.setString(device_id_key, _deviceId);
  }
}
