import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_vss/product/theme/custom_theme.dart';
import 'package:flutter_vss/product/theme/theme_color_scheme.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkScheme(),
      );
}
