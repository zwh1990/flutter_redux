import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
}