import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xFF15645E),
      primaryContainer: Color(0xFFD0E4FF),
      secondary: Color(0xFFAC3306),
      secondaryContainer: Color(0xFFFFDBCF),
      tertiary: Color(0xFF006875),
      tertiaryContainer: Color(0xFF95F0FF),
      appBarColor: Color(0xFFFFDBCF),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    // Surface color adjustments.
    surfaceTint: const Color(0xFF29ABE2),
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF00325B),
      primaryLightRef: Color(0xFF15645E), // The color of light mode primary
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFF872100),
      secondaryLightRef: Color(0xFFAC3306), // The color of light mode secondary
      tertiary: Color(0xFF86D2E1),
      tertiaryContainer: Color(0xFF004E59),
      tertiaryLightRef: Color(0xFF006875), // The color of light mode tertiary
      appBarColor: Color(0xFFFFDBCF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
