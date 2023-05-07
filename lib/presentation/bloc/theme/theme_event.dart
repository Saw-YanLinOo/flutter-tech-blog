import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class GetThemeEvent extends ThemeEvent {
  GetThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  ChangeThemeEvent({required this.themeMode});
}
