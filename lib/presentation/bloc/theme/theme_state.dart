import 'package:flutter/material.dart';

abstract class ThemeState {
  final ThemeMode? themeMode;

  ThemeState(this.themeMode);
}

class GetThemeState extends ThemeState {
  GetThemeState(super.themeMode);
}

class FailThemeState extends ThemeState {
  final Exception e;

  FailThemeState(this.e, super.themeMode);
}
