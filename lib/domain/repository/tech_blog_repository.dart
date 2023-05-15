import 'package:firebase_auth/firebase_auth.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/domain/models/user_model.dart';

enum ThemeModeEnum { light, dark }

abstract class TechBlogRepository {
  ThemeModeEnum loadThemeMode();
  Future<void> saveThemeMode(ThemeModeEnum themeMode);
  Future<List<Blog>> getAllBlog();
  Future<List<Blog>> getBlogByUserID(String id);
  Future<User?> registerWithEmailPassword(UserModel newUser);
  Future<User?> loginWithEmailPassword(String email, String password);

  bool isLoggedIn();
  UserModel? getLoggedInUser();
  Future logOut();
}
