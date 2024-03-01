import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences
{
  static Future<void> setUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", true);
  }

  static Future<bool> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin=prefs.getBool("isLogin") ?? false;
    if(isLogin)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
}