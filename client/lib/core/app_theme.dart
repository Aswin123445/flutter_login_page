import 'package:client/core/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: _border(const Color(0xFFadbada)),
      enabledBorder: _border(Pallete.borderColor),
    ),
  );
}
