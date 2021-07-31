import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get description;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get title => GoogleFonts.montserrat(
        fontSize: 40.0,
        fontWeight: FontWeight.w600,
        height: 1.12,
      );

  @override
  TextStyle get button => GoogleFonts.inter(
        fontSize: 16.0,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get description => GoogleFonts.inter(
        fontSize: 16.0,
        height: 1.62,
        color: AppTheme.colors.description,
      );
}
