import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_vss/product/init/theme/custom_theme.dart';
import 'package:flutter_vss/product/init/theme/theme_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkScheme(),
        fontFamily: fontFamily,
      );

  @override
  String? get fontFamily => GoogleFonts.roboto().fontFamily;
}
