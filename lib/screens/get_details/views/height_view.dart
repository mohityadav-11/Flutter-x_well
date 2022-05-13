import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../constants/app_colors.dart';
import '../controllers/get_details_controller.dart';
import 'card_view.dart';

class HeightView extends GetView {
  HeightView({Key? key}) : super(key: key);

  final GetDetailsController _controller= Get.find<GetDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return CardView(
        title: "Height (cm)",
        child: NumberPicker(
          value: _controller.height,
          selectedTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 30
          ),
          minValue: 90,
          maxValue: 290,
          axis: Axis.horizontal,
          onChanged: _controller.onHeightChange,
          //onChanged: (value) => setState(() => _currentValue = value),
        ),
      );
    });
  }
}
