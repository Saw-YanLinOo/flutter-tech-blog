import 'package:firebase_auth/firebase_auth.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/domain/models/user_model.dart';

abstract class TechBlogApi {
  Future<List<Blog>> getAllBlog();
  bool isLoggedIn();
  UserModel getLoggedInUser();
  Future logOut();
  Future<User?> loginWithEmailPassword(String email, String password);
  Future<User?> registerWithEmailPassword(UserModel newUser);
}
