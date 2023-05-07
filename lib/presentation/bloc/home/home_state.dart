import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {}

class ChangeThemeState extends HomeState {
  final ThemeMode? themeMode;

  ChangeThemeState(this.themeMode);

  @override
  // TODO: implement props
  List<Object?> get props => [themeMode];
}
