import 'package:firebase_auth/firebase_auth.dart';
import 'package:techblog/core/local/local_constant.dart';
import 'package:techblog/core/local/my_share_perference.dart';
import 'package:techblog/core/remote/firebase_api_impl.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/domain/models/user_model.dart';
import 'package:techblog/domain/repository/tech_blog_repository.dart';

class TechBlogRepositoryImpl extends TechBlogRepository {
  TechBlogRepositoryImpl._();
  static final _singleton = TechBlogRepositoryImpl._();
  factory TechBlogRepositoryImpl() => _singleton;

  final FirebaseApiImpl _firebase = FirebaseApiImpl();
  final MySharePerference _local = MySharePerference();

  @override
  ThemeModeEnum loadThemeMode() {
    MySharePerference prefs = MySharePerference();

    var themeModeString =
        prefs.getString(keyThemeMode) ?? ThemeModeEnum.dark.name;

    return ThemeModeEnum.values.firstWhere((e) => e.name == themeModeString,
        orElse: () => ThemeModeEnum.light);
  }

  @override
  Future<bool> saveThemeMode(ThemeModeEnum themeMode) {
    MySharePerference prefs = MySharePerference();
    return prefs.setString(keyThemeMode, themeMode.name);
  }

  @override
  Future<List<Blog>> getAllBlog() {
    return _firebase.getAllBlog();
  }

  @override
  Future<List<Blog>> getBlogByUserID(String id) {
    return _firebase.getAllBlog().then((blogList) {
      return blogList.where((e) => e.userId == id).toList();
    });
  }

  @override
  Future<User?> loginWithEmailPassword(String email, String password) async {
    return await _firebase
        .loginWithEmailPassword(email, password)
        .then((user) async {
      UserModel savedUser = UserModel(
        id: user?.uid,
        email: user?.email,
        phone: user?.phoneNumber,
        name: user?.displayName,
        avatorUrl: user?.photoURL,
      );
      await _local.setUserModel(savedUser);
      return user;
    });
  }

  @override
  Future<User?> registerWithEmailPassword(UserModel newUser) async {
    return _firebase.registerWithEmailPassword(newUser).then((user) async {
      UserModel savedUser = UserModel(
        id: user?.uid,
        email: user?.email,
        phone: user?.phoneNumber,
        name: user?.displayName,
        avatorUrl: user?.photoURL,
      );
      await _local.setUserModel(savedUser);
      return user;
    });
  }

  @override
  UserModel? getLoggedInUser() {
    // return _firebase.getLoggedInUser();
    return _local.getUserModel();
  }

  @override
  bool isLoggedIn() {
    return _firebase.isLoggedIn();
  }

  @override
  Future logOut() {
    return _firebase.logOut();
  }
}
