import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/get_details/views/card_view.dart';
import 'package:x_well/screens/get_details/views/small_box_view.dart';

import '../controllers/get_details_controller.dart';

class GenderDetailsView extends GetView {
  GenderDetailsView({Key? key}) : super(key: key);

  final GetDetailsController _controller = Get.find<GetDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return CardView(
        title: "Gender",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SmallBoxView(
              icon: Icons.male,
              label: "Male",
              selected: _controller.gender == "Male",
              onTap: () => _controller.onGenderChange("Male"),
            ),
            SmallBoxView(
              icon: Icons.female,
              label: "Female",
              selected: _controller.gender == "Female",
              onTap: () => _controller.onGenderChange("Female"),
            ),
          ],
        ),
      );
    });
  }
}
