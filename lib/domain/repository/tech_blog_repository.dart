import 'package:techblog/domain/models/blog.dart';

enum ThemeModeEnum { light, dark }

abstract class TechBlogRepository {
  ThemeModeEnum loadThemeMode();
  Future<void> saveThemeMode(ThemeModeEnum themeMode);
  Future<List<Blog>> getAllBlog();
  Future<List<Blog>> getBlogByUserID(String id);
}
