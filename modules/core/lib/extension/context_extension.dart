import 'package:flutter/material.dart';

/// context extensions for handling various build context shorthands
extension ContextExtensions on BuildContext {
  ///call current theme
  ThemeData get theme => Theme.of(this);

  ///call text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  ///call current color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
