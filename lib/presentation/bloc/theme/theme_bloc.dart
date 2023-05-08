import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/domain/repository/tech_blog_repository.dart';
import 'package:techblog/domain/repository/tech_blog_repository_impl.dart';
import 'package:techblog/presentation/bloc/theme/theme_event.dart';
import 'package:techblog/presentation/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(GetThemeState(ThemeMode.light)) {
    on<GetThemeEvent>(_getThemeEvent);
    on<ChangeThemeEvent>(_changeThemeEvent);
  }

  final TechBlogRepositoryImpl repository = TechBlogRepositoryImpl();

  _getThemeEvent(GetThemeEvent event, Emitter<ThemeState> emit) {
    var themeModeEnum = repository.loadThemeMode();
    if (themeModeEnum == ThemeModeEnum.dark) {
      emit(GetThemeState(ThemeMode.dark));
    } else {
      emit(GetThemeState(ThemeMode.light));
    }
  }

  _changeThemeEvent(ChangeThemeEvent event, Emitter<ThemeState> emit) {
    var themeMode = event.themeMode;
    emit(GetThemeState(themeMode));
    if (themeMode == ThemeMode.dark) {
      repository.saveThemeMode(ThemeModeEnum.dark);
    } else {
      repository.saveThemeMode(ThemeModeEnum.light);
    }
  }
}
