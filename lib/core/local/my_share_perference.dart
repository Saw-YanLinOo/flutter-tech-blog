import 'package:shared_preferences/shared_preferences.dart';

class MySharePerference {
  late final SharedPreferences _pref;

  MySharePerference.singleton();

  static final MySharePerference _singleton = MySharePerference.singleton();
  factory MySharePerference() => _singleton;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    print("init success : $_pref");
  }

  Future<bool> setString(String key, String value) {
    return _pref.setString(key, value);
  }

  String? getString(String key) {
    return _pref.getString(key);
  }
}
