import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';

class TitleView extends GetView{

  final String title;

  TitleView({required this.title});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}