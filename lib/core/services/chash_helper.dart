import 'package:shared_preferences/shared_preferences.dart';

class ChashHelper {
  static late SharedPreferences sharedPreferences;
  // getInstance of SharedPreferences
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // save data
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setStringList(key, value);
    }
  }

  // get data
  List<dynamic> getData({required String key}) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  // remove
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // clear data
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  // containes data
  bool containesData({required String key}) {
    return sharedPreferences.containsKey(key);
  }
}
