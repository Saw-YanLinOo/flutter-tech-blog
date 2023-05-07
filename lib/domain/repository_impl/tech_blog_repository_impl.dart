import 'package:techblog/core/local/local_constant.dart';
import 'package:techblog/core/local/my_share_perference.dart';
import 'package:techblog/domain/repository/tech_blog_repository.dart';

class TechBlogRepositoryImpl extends TechBlogRepository {
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
}
