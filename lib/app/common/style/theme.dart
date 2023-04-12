import 'package:flutter/material.dart';
import 'package:crossface/app/common/style/colors.dart';
import 'package:crossface/app/common/style/text_style.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.colorPrimary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: AppColors.colorsScaffoldBackground,
      primary: AppColors.colorPrimary,
      onPrimary: AppColors.colorOnPrimaryText,
      secondary: AppColors.colorSecondary,
      onSecondary: AppColors.colorSecondary,
      error: AppColors.colorAccentRed,
      onError: AppColors.colorOnPrimaryText,
      onBackground: AppColors.colorPrimaryText,
      surface: AppColors.cardBackground,
      onSurface: AppColors.colorPrimaryText,
    ),

    textTheme: const TextTheme(
      //displayLarge: ,
      //displayMedium: ,
      //displaySmall: ,
      titleLarge: TextStyles.Title1,
      titleMedium: TextStyles.Title2,
      titleSmall: TextStyles.Title3,
      headlineLarge: TextStyles.HeaderlineLarge,
      headlineMedium: TextStyles.HeaderlineLargeMedium,
      //headlineSmall: ,
      labelLarge: TextStyles.LabelLarge,
      //labelMedium: ,
      //labelSmall: ,
      bodyLarge: TextStyles.BodyLarge,
      bodyMedium: TextStyles.BodyMedium,
      bodySmall: TextStyles.BodySmall,
    ),
  );
}

