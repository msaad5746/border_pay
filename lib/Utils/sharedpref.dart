import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._privateConstructor() {
    getInstance();
  }

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();
  SharedPreferences? myPrefs;

  getInstance() async {
    myPrefs = await SharedPreferences.getInstance();
  }

  setStringValue(String key, String value) {
    myPrefs?.setString(key, value);
  }

  setIntValue(String key, int value) {
    myPrefs?.setInt(key, value);
  }

  setBoolValue(String key, bool value) {
    myPrefs?.setBool(key, value);
  }

  bool getBoolValue(String key) {
    if (myPrefs!.containsKey(key)) {
      return myPrefs?.getBool(key) ?? false;
    } else {
      return false;
    }
  }

  String getStringValue(String key) {
    return myPrefs?.getString(key) ?? "";
  }

  int getIntValue(String key) {
    return myPrefs?.getInt(key) ?? 0;
  }

  bool containsKey(String key) {
    return myPrefs!.containsKey(key);
  }

  removeValue(String key) {
    return myPrefs!.remove(key);
  }

  removeAll() {
    return myPrefs!.clear();
  }
}
