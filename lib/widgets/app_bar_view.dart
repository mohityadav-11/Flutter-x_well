import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppBarView extends GetView{

  final String title;

  AppBarView(this.title);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        BackButton(
          onPressed: () => Get.back(),
          color: AppColors.primaryColor,
        ),

        Flexible(
          child: Container(
            padding: EdgeInsets.all(3.0),
            margin: EdgeInsets.only(left: 10, top: 10),
            alignment: Alignment.centerLeft,
            width: double.maxFinite,
            child: Text(
              title,
              style: GoogleFonts.kalam(
                  color: AppColors.primaryColor, fontSize: 29),
            ),
          ),
        ),
      ],
    );
  }

}