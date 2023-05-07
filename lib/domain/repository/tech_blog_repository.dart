enum ThemeModeEnum { light, dark }

abstract class TechBlogRepository {
  ThemeModeEnum loadThemeMode();
  Future<void> saveThemeMode(ThemeModeEnum themeMode);
}
