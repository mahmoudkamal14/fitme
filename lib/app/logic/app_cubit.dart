import 'package:fitme/app/logic/app_state.dart';
import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/cache/cache_helper_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeModeState { light, dark, system }

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState()) {
    _loadTheme();
  }

  static AppCubit get(context) => BlocProvider.of(context);

  ThemeModeState currentTheme = ThemeModeState.system;

  Future<void> selectTheme(ThemeModeState theme) async {
    currentTheme = theme;
    getThemeMode();
    emit(ThemeChangedState(themeMode: getThemeMode()));

    await CacheHelper().saveData(
      key: CacheHelperKey.themeMode,
      value: currentTheme.name,
    );
  }

  Future<void> _loadTheme() async {
    String? savedTheme = await CacheHelper().getData(
      key: CacheHelperKey.themeMode,
    );

    if (savedTheme != null) {
      currentTheme = ThemeModeState.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeModeState.system,
      );
    }

    emit(ThemeChangedState(themeMode: getThemeMode()));
  }

  ThemeMode getThemeMode() {
    switch (currentTheme) {
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }
}
