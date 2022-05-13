import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class SmallBoxView extends GetView {
  const SmallBoxView({Key? key, required this.icon, required this.label, required this.onTap,this.selected = false}) : super(key: key);

  final String label;
  final void Function() onTap;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected? AppColors.primaryColor : Get.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: 80,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 29,
                color: selected ? AppColors.blockOrWhite : AppColors.primaryColor,
              ),
              SizedBox(height: 5,),
              Text(label,style: TextStyle(
                color: selected ? AppColors.blockOrWhite : AppColors.primaryColor,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
