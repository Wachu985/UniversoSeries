import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSinglenton {
  //==========Patron Singlenton=============
  static final SharedPreferencesSinglenton _instancia =
      SharedPreferencesSinglenton._internal();

  factory SharedPreferencesSinglenton() {
    return _instancia;
  }

  SharedPreferencesSinglenton._internal();
  //==========Patron Singlenton=============

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET y SET
  bool get darkMode => _prefs?.getBool("darkMode") ?? false;

  set darkMode(bool value) => _prefs?.setBool("darkMode", value);

  int get selectedColor => _prefs?.getInt("selectedColor") ?? 1;

  set selectedColor(int value) => _prefs?.setInt("selectedColor", value);

  int get selectedLanguaje => _prefs?.getInt("selectedLanguaje") ?? 0;

  set selectedLanguaje(int value) => _prefs?.setInt("selectedLanguaje", value);
}
