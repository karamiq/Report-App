import 'package:app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'extra_colors.dart';

class AppTheme {
  ThemeData _build(Brightness brightness) {
    final themeData = ThemeData(
        scaffoldBackgroundColor: _buildscaffoldBackgroundColorTheme(brightness),
        useMaterial3: true,
        brightness: brightness,
        extensions: [buildExtraColors()],
        inputDecorationTheme: _buildInputDecorationTheme(brightness),
        colorScheme: _buildColorScheme(brightness),
        filledButtonTheme: _buildFilledButtonTheme(brightness),
        outlinedButtonTheme: _buildOutlinedButtonTheme(brightness),
        elevatedButtonTheme: _buildElevatedButtonTheme(brightness),
        textButtonTheme: _buildTextButtonTheme(brightness),
        iconButtonTheme: _buildIconButtonTheme(brightness));

    return themeData.copyWith(
      textTheme: _buildTextTheme(themeData.textTheme),
    );
  }

  final borderRadius = BorderRadius.circular(BorderSize.small);
  final padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 14);

  Brightness getBrightness() {
    return currentBrightness.value;
  }

  final currentBrightness = ValueNotifier<Brightness>(Brightness.light);

  ThemeData buildDarkTheme() {
    currentBrightness.value = Brightness.dark;
    return _build(Brightness.dark);
  }

  ThemeData buildLightTheme() {
    currentBrightness.value = Brightness.light;
    return _build(Brightness.light);
  }

  InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);

    OutlineInputBorder buildBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      contentPadding: padding,
      fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.5),
      filled: true,
      activeIndicatorBorder: BorderSide.none,
      border: buildBorder(colorScheme.outline.withOpacity(0.5)),
      errorBorder: buildBorder(colorScheme.error),
      enabledBorder: buildBorder(colorScheme.outline.withOpacity(0.5)),
      focusedBorder: buildBorder(colorScheme.primary),
      focusedErrorBorder: buildBorder(colorScheme.error, width: 2),
      disabledBorder: buildBorder(colorScheme.outline.withOpacity(0.5)),
    );
  }

  TextTheme _buildTextTheme(TextTheme textTheme) {
    return GoogleFonts.cairoTextTheme(textTheme);
  }

  ExtraColors buildExtraColors() {
    return const ExtraColors(
      success: Color.fromARGB(255, 28, 101, 30),
      onSuccess: Colors.white,
      error: Color.fromARGB(255, 255, 0, 0),
    );
  }

  ColorScheme _buildColorScheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      //seedColor: const Color.fromARGB(255, 17, 61, 128),
      seedColor: const Color(0xFF2684FF),
      primary: const Color(0xFF2684FF),
      brightness: brightness,
    );

    return colorScheme.copyWith(
      outline: colorScheme.outline.withOpacity(0.5),
    );
  }

  FilledButtonThemeData _buildFilledButtonTheme(Brightness brightness) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 55),
        maximumSize: const Size(double.infinity, double.infinity),
        // padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        side: BorderSide(
          color: colorScheme.primary,
          width: 2.0,
        ),
      ),
    );
  }

  Color _buildscaffoldBackgroundColorTheme(Brightness brightness) {
    Color? colorj;
    if (brightness == Brightness.light) {
      colorj = Colors.white;
    } else if (brightness == Brightness.dark) {
      colorj = Colors.black54;
    }
    return colorj!;
  }

  TextButtonThemeData _buildTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        elevation: 0,
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  IconButtonThemeData _buildIconButtonTheme(brightness) {
    final colorScheme = _buildColorScheme(brightness);

    return IconButtonThemeData(
        style: IconButton.styleFrom(
            backgroundColor: colorScheme.surface, foregroundColor: colorScheme.primary));
  }
}

final colorSchemeNotifier = ValueNotifier<ColorScheme>(ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 17, 61, 128),
  brightness: AppTheme().getBrightness(),
));
