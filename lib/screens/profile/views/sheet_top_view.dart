import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SheetTopView extends GetView{
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0)),
      ),
      child: Text(
        "Schedule appointment:",
        style: TextStyle(
            color: AppColors.blockOrWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),
      ),
    );
  }

}