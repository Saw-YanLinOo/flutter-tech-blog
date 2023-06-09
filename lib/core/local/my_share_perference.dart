import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:techblog/core/local/local_constant.dart';
import 'package:techblog/domain/models/user_model.dart';

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

  Future setUserModel(UserModel user) {
    return _pref.setString(keyUserModel, jsonEncode(user.toJson()));
  }

  UserModel? getUserModel() {
    try {
      var userString = _pref.getString(keyUserModel);
      var userModel = UserModel.fromJson(jsonDecode(userString ?? ""));
      return userModel;
    } catch (e) {
      return null;
    }
  }
}
