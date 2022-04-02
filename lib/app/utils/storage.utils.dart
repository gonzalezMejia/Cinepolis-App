import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  static Future<String> getStringByKey(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getString(key);
    return result ?? '';
  }

  static void setStringKey(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}

class SharedPreferenceUtils {
  static void addString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    return stringValue ?? '';
  }

  static removeValues(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove String
    prefs.remove(key);
  }
}
