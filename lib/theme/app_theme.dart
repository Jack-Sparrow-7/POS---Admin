import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'tokens.dart';

class AppTheme {
  static MixScope mixLight({required Widget child}) {
    return MixScope(
      colors: {
        // Base
        $background: const Color(0xFFF7F8FA),
        $foreground: const Color(0xFF1F2933),

        // Card / Popover
        $card: const Color(0xFFFFFFFF),
        $cardFg: const Color(0xFF1F2933),

        $popover: const Color(0xFFFFFFFF),
        $popoverFg: const Color(0xFF1F2933),

        // Primary / Secondary
        $primary: const Color(0xFF1E2047),
        $primaryFg: const Color(0xFFFFFFFF),

        $secondary: const Color(0xFFEDEFF2),
        $secondaryFg: const Color(0xFF1F2933),

        // Muted / Accent
        $muted: const Color(0xFFF1F3F5),
        $mutedFg: const Color(0xFF6B7280),

        $accent: const Color(0xFFEDEFF2),
        $accentFg: const Color(0xFF1F2933),

        // States
        $destructive: const Color(0xFFE23B3B),
        $destructiveFg: const Color(0xFFFFFFFF),

        $success: const Color(0xFF2FA36B),
        $successFg: const Color(0xFFFFFFFF),

        $warning: const Color(0xFFF59E0B),
        $warningFg: const Color(0xFFFFFFFF),

        $info: const Color(0xFF3B82F6),
        $infoFg: const Color(0xFFFFFFFF),

        // Border / Input
        $border: const Color(0xFFE6E8EB),
        $input: const Color(0xFFE6E8EB),
        $ring: const Color(0xFF1E2047),

        // Sidebar
        $sidebarBg: const Color(0xFFFFFFFF),
        $sidebarFg: const Color(0xFF6B7280),
        $sidebarPrimary: const Color(0xFF1E2047),
        $sidebarPrimaryFg: const Color(0xFFFFFFFF),
        $sidebarAccent: const Color(0xFFF4F5F7),
        $sidebarAccentFg: const Color(0xFF1E2047),
        $sidebarBorder: const Color(0xFFE7E9EC),
        $sidebarRing: const Color(0xFF2A2F55),
      },

      radii: {
        $radiusMd: const Radius.circular(10),
        $radiusSm: const Radius.circular(8),
      },

      child: child,
    );
  }

  static ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,

    // Scaffold
    scaffoldBackgroundColor: $background.resolve(context),

    // Color Scheme (core system)
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: $primary.resolve(context),
      onPrimary: $primaryFg.resolve(context),

      secondary: $secondary.resolve(context),
      onSecondary: $secondaryFg.resolve(context),

      error: $destructive.resolve(context),
      onError: $destructiveFg.resolve(context),

      surface: $card.resolve(context),
      onSurface: $cardFg.resolve(context),
    ),

    // Divider / border
    dividerColor: $border.resolve(context),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: $background.resolve(context),
      foregroundColor: $foreground.resolve(context),
      elevation: 0,
    ),

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: $background.resolve(context),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: $border.resolve(context)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: $border.resolve(context)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: $ring.resolve(context), width: 1.5),
      ),
    ),
  );
}
