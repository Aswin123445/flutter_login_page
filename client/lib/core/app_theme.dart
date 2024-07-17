import 'package:client/core/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.borderColor,
          width: 3,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.borderColor,
          width: 3,
        ),
      ),
    ),
  );
}
