import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../constants/app_colors.dart';
import '../controllers/get_details_controller.dart';
import 'card_view.dart';

class WeightView extends GetView {
  WeightView({Key? key}) : super(key: key);

  final GetDetailsController _controller= Get.find<GetDetailsController>();


  @override
  Widget build(BuildContext context) {
    return Obx((){
      return CardView(
        title: "Weight (kg)",
        child: NumberPicker(
          value: _controller.weight,
          selectedTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 30
          ),
          minValue: 16,
          maxValue: 290,
          axis: Axis.horizontal,
          onChanged: _controller.onWeightChange,
          //onChanged: (value) => setState(() => _currentValue = value),
        ),
      );
    });
  }
}
