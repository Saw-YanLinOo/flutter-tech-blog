import 'package:techblog/core/local/local_constant.dart';
import 'package:techblog/core/local/my_share_perference.dart';
import 'package:techblog/core/remote/firebase_api_impl.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/domain/repository/tech_blog_repository.dart';

class TechBlogRepositoryImpl extends TechBlogRepository {
  TechBlogRepositoryImpl._();
  static final _singleton = TechBlogRepositoryImpl._();
  factory TechBlogRepositoryImpl() => _singleton;

  final FirebaseApiImpl _firebase = FirebaseApiImpl();

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
}
