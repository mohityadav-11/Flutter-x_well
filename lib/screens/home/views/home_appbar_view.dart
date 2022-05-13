import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:x_well/constants/app_colors.dart';

import '../../tabs/controllers/tabs_controller.dart';

class HomeAppbarView extends GetView{

  final TabsController _controller = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(3.0),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Welcome!",
                style: GoogleFonts.kalam(
                    color: AppColors.primaryColor,
                    fontSize: 29
                ),),
            ),
          ),
        ),

        /// theme switch button
        Obx((){
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(3.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 25,
                  width: 60,
                  margin: EdgeInsets.only(right: 10),
                  child: SwitcherButton(
                    value: _controller.isDark,
                    onChange: _controller.toggleTheme,
                  ),
                ),
              ),
            ),
          );
        }),

      ],
    );
  }

}