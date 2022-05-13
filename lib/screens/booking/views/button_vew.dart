import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class ButtonView extends GetView {
  final String title;
  final bool selected;
  final void Function()? onPressed;

  ButtonView(
      {required this.title, required this.onPressed, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: selected
          ? AppColors.primaryColor
          : onPressed == null
              ? AppColors.primaryColor.withOpacity(0.1)
              : Get.theme.scaffoldBackgroundColor,
      child: InkWell(
        onTap: selected ? null : onPressed,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? AppColors.blockOrWhite : AppColors.primaryColor,
              decoration: onPressed == null? TextDecoration.lineThrough: TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}
