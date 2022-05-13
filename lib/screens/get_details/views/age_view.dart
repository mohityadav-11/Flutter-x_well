import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:x_well/constants/app_colors.dart';

import '../controllers/get_details_controller.dart';
import 'card_view.dart';

class AgeView extends GetView {
  AgeView({Key? key}) : super(key: key);
  final GetDetailsController _controller = Get.find<GetDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return CardView(
        title: "Age",
        child: NumberPicker(
          value: _controller.age,
          selectedTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 30,
          ),
          minValue: 16,
          maxValue: 100,
          axis: Axis.horizontal,
          onChanged: _controller.onAgeChange,
        ),
      );
    });
  }
}
