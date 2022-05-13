import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class AppListTileView extends GetView {

  AppListTileView({required this.title, required this.iconData, required this.onClick});

  final void Function() onClick;
  final String title;
  final IconData iconData;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: onClick,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: AppColors.primaryColor,
          title: Row(
            children: [
              Icon(
                iconData,
                color: AppColors.blockOrWhite,
              ),
              SizedBox(width: 10,),
              Text(
                title,
                style: TextStyle(
                    color: AppColors.blockOrWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
