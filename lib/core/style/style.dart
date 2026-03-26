import 'package:flutter/material.dart';
import 'repo.dart';

abstract class AppStyle {
  static ThemeData get LightTheme {
    return ThemeData(
      primaryColor: StyleRepo.glowGreen,

      iconTheme: const IconThemeData(
        color: StyleRepo.white,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xffF3F3F3),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: StyleRepo.grey.withOpacity(.3),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: StyleRepo.glowGreen,
            width: 2,
          ),
        ),
      ),
    );
  }
}