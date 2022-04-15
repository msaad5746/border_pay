import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._privateConstructor() {
    getInstance();
  }

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();
  late SharedPreferences myPrefs;

  getInstance() async {
    myPrefs = await SharedPreferences.getInstance();
  }

  setStringValue(String key, String value) {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  setBoolValue(String key, bool value) {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  bool getBoolValue(String key) {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if (myPrefs.containsKey(key)) {
      return myPrefs.getBool(key) ?? false;
    } else {
      return false;
    }
  }

  String getStringValue(String key) {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "";
  }

  bool containsKey(String key) {
    return myPrefs.containsKey(key);
  }

  removeValue(String key) {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(key);
  }

  removeAll() {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.clear();
  }
}
