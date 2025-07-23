import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme get _lightColors {
    return ColorScheme(
      brightness: Brightness.light,
      primary: Colors.greenAccent,
      onPrimary: Colors.green,
      primaryContainer: Colors.greenAccent,
      onPrimaryContainer: Colors.green,
      secondary: Colors.purpleAccent,
      onSecondary: Colors.purple,
      secondaryContainer: Colors.purpleAccent,
      onSecondaryContainer: Colors.purple,
      tertiary: Colors.indigoAccent,
      onTertiary: Colors.indigo,
      tertiaryContainer: Colors.indigoAccent,
      onTertiaryContainer: Colors.indigo,
      surface: Color(0xFFF5F5F5),
      onSurface: Colors.black,
      surfaceContainerHighest: Colors.black26,
      onSurfaceVariant: Colors.black,
      outline: Colors.grey,
      outlineVariant: Colors.black54,
      error: Colors.red,
      onError: Colors.red,
      errorContainer: Colors.redAccent,
    );
  }

  static ColorScheme get _darkColors {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.green,
      onPrimary: Colors.greenAccent,
      primaryContainer: Colors.green,
      onPrimaryContainer: Colors.greenAccent,
      secondary: Colors.purple,
      onSecondary: Colors.purpleAccent,
      secondaryContainer: Colors.purple,
      onSecondaryContainer: Colors.purpleAccent,
      tertiary: Colors.indigo,
      onTertiary: Colors.indigoAccent,
      tertiaryContainer: Colors.indigo,
      onTertiaryContainer: Colors.indigoAccent,
      surface: Colors.black,
      onSurface: Color(0xFFF5F5F5),
      surfaceContainerHighest: Colors.black54,
      onSurfaceVariant: Color(0xFFF5F5F5),
      outline: Colors.grey,
      outlineVariant: Colors.black26,
      error: Colors.redAccent,
      onError: Colors.redAccent,
      errorContainer: Colors.red,
    );
  }

  static TextTheme _textTheme(ColorScheme colors) {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 52 / 45,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 44 / 36,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 40 / 32,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 36 / 28,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.15,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        letterSpacing: 0.5,
      ),
    ).apply(bodyColor: colors.onSurface, displayColor: colors.onSurface);
  }

  static ThemeData _appTheme(ColorScheme colors) {
    final textTheme = _textTheme(colors);

    return ThemeData(
      brightness: colors.brightness,
      scaffoldBackgroundColor: colors.surface,
      fontFamily: 'Ubuntu',
      textTheme: textTheme,
      colorScheme: colors,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF2A2A2A), //TODO: Check this color (I like it)
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        hintStyle: TextStyle(
          color: colors.onSurface,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(color: colors.onSurface),
      ),
      //TODO: Style platform buttons
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            colors.primary,
          ),
          iconColor: WidgetStatePropertyAll(
            colors.onPrimary,
          ),
          textStyle: WidgetStatePropertyAll(
            textTheme.labelLarge?.copyWith(
              color: colors.onPrimaryContainer,
            ),
          ),
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      //TODO: Style Dialog
      dialogTheme: DialogThemeData(),
    );
  }

  static ThemeData appTheme(bool isDarkMode) {
    return isDarkMode ? _appTheme(_darkColors) : _appTheme(_lightColors);
  }
}
