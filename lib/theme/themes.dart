import 'package:flutter/material.dart';
import '../constants/app_colors.dart';


class Themes {


  /// data for light theme
  static final light = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
  );

  /// data for dark theme
  static final dark = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
  );
}