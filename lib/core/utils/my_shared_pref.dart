import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {

  static const LAST_LOADED_DATE = "last_loaded_date";

  final SharedPreferences _pref;

  MySharedPref(this._pref);

  void saveLastLoadedState(String dateTime) {
    _pref.setString(LAST_LOADED_DATE, dateTime);
  }

  String getLastLoadedState() {
    return _pref.getString(LAST_LOADED_DATE);
  }
}