import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const ColorScheme _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0XFF81C784),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF26A96A),
  onSecondary: Color(0xFFFFFFFF),
  tertiary: Color(0xFFE5E5EA),
  onTertiary: Color(0xFF000000),
  error: Colors.red,
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF000000),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
);
final TextTheme _lightTextTheme = TextTheme(
  titleLarge:
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: _colorScheme.onBackground),
  bodyLarge:
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: _colorScheme.onBackground),
  bodyMedium:
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _colorScheme.onBackground),
  bodySmall:
      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: _colorScheme.onBackground),
);

final AppBarTheme _appBarTheme = AppBarTheme(
  backgroundColor: Colors.transparent,
  centerTitle: true,
  foregroundColor: _colorScheme.onBackground,
  elevation: 0,
);
final IconThemeData _iconTheme = IconThemeData(
  color: const Color(0xdd000000),
  opacity: 1,
  size: 24.w,
);
final ThemeData appLightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  hintColor: const Color(0XFF3C3C43),
  colorScheme: _colorScheme,
  textTheme: _lightTextTheme,
  appBarTheme: _appBarTheme,
  iconTheme: _iconTheme,
);
