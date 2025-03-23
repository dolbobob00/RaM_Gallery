import 'package:flutter/material.dart';
import 'app_fonts.dart';
import 'app_colors.dart';

//! In hive fetch by name like "theme" it will return the value of the theme
//! like naming of variable "lightTheme" and smth
class Themes {
  static final Map<String, ThemeData> themes = {
    'lightTheme': ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        onPrimary: Colors.white,
        secondary: AppColors.lightSecondary,
        surface: AppColors.lightSurface,
        error: AppColors.lightError,
        inversePrimary: const Color.fromRGBO(0, 0, 0, 1),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColors.lightSecondary,
          ),
        ),
      ),
      scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightAppBarBackground,
        foregroundColor: AppColors.lightAppBarForeground,
      ),
      textTheme: TextTheme(
        displayLarge: AppFonts.displayLarge,
        titleLarge: AppFonts.titleLarge,
        titleMedium: AppFonts.titleMedium,
        bodyLarge: AppFonts.bodyLarge,
        bodyMedium: AppFonts.bodyMedium,
        bodySmall: AppFonts.bodySmall,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.lightPrimary,
        textTheme: ButtonTextTheme.primary,
        shape: StadiumBorder(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.lightPrimary,
        unselectedItemColor: AppColors.lightSecondary,
      ),
    ),
    'darkTheme': ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        onPrimary: Colors.white,
        surface: AppColors.darkSurface,
        error: AppColors.darkError,
        inversePrimary: AppColors.darkAppBarForeground,
      ),
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: AppColors.darkSurface,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColors.darkSecondary,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.darkAppBarBackground,
        foregroundColor: AppColors.darkAppBarForeground,
      ),
      textTheme: TextTheme(
        displayLarge:
            AppFonts.displayLarge.copyWith(color: AppColors.darkTextPrimary),
        titleLarge:
            AppFonts.titleLarge.copyWith(color: AppColors.darkTextTitle),
        titleMedium: AppFonts.titleMedium,
        bodyLarge: AppFonts.bodyLarge.copyWith(color: AppColors.darkTextBody),
        bodyMedium:
            AppFonts.bodyMedium.copyWith(color: AppColors.darkTextSecondary),
        bodySmall: AppFonts.bodySmall,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.darkPrimary,
        textTheme: ButtonTextTheme.primary,
        shape: const StadiumBorder(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.darkPrimary,
        unselectedItemColor: AppColors.darkSecondary,
        backgroundColor: AppColors.darkSurface,
      ),
    ),
  };
}
