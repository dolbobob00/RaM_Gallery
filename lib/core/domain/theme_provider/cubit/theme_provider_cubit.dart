import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:voice_assistant/core/config/constants/constants.dart';
import 'package:voice_assistant/core/config/theme/themes.dart';
import 'package:voice_assistant/core/domain/local_database/local_database.dart';

class ThemeProviderCubit extends Cubit<ThemeData> {
  // Init theme as first state, we
  // from Themes.themes constant map of themes
  // getting value from key
  // but first we need take key that exactly containing in hive.
  // so we getting this key and after we getting theme init by key
  ThemeProviderCubit()
      : super(
          Themes.themes[GetIt.I<ILocalDatabase>().readData<String>('theme') ?? 'lightTheme'] 
              ?? ThemeData.light(),
        );
  int _themeNum = 0;
  void updateTheme({required String themeName}) {
    GetIt.I<ILocalDatabase>().writeData(
      'theme',
      themeName,
    );
    emit(
      Themes.themes[themeName] ?? ThemeData(),
    );
  }
  final constants = GetIt.I<Constants>();
  void changeThemeToNext() {
    if (_themeNum == 0) {
      GetIt.I<ILocalDatabase>().writeData(
        'theme',
        constants.themeNames[0],
      );
      emit(
        Themes.themes[constants.themeNames[0]] ?? ThemeData(),
      );
      _themeNum = 1;
    } else if (_themeNum == 1) {
      GetIt.I<ILocalDatabase>().writeData(
        'theme',
        constants.themeNames[1],
      );
      emit(
        Themes.themes[constants.themeNames[1]] ?? ThemeData(),
      );
      _themeNum = 0;
    }
  }
}
