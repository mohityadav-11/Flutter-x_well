import 'package:flutter/material.dart';
import 'package:x_well/constants/app_colors.dart';

Widget loading() => Center(
  child:   CircularProgressIndicator(
    strokeWidth: 2.5,
    backgroundColor: AppColors.primaryColor.withOpacity(0.5),
    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
  ),
);