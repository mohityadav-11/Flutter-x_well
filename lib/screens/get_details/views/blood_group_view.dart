import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/get_details/views/card_view.dart';

import '../../../constants/app_colors.dart';
import '../controllers/get_details_controller.dart';

class BloodGroupView extends GetView {
  BloodGroupView({Key? key}) : super(key: key);

  final GetDetailsController _controller = Get.find<GetDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CardView(
        title: "Blood Group",
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GroupView(
                  type: "A+",
                  selected: _controller.bloodGroup == "A+",
                  onTap: () => _controller.onBloodGroupChange("A+"),
                ),
                GroupView(
                  type: "A-",
                  selected: _controller.bloodGroup == "A-",
                  onTap: () => _controller.onBloodGroupChange("A-"),
                ),
                GroupView(
                  type: "B+",
                  selected: _controller.bloodGroup == "B+",
                  onTap: () => _controller.onBloodGroupChange("B+"),
                ),
                GroupView(
                  type: "B-",
                  selected: _controller.bloodGroup == "B-",
                  onTap: () => _controller.onBloodGroupChange("B-"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GroupView(
                  type: "O+",
                  selected: _controller.bloodGroup == "O+",
                  onTap: () => _controller.onBloodGroupChange("O+"),
                ), GroupView(
                  type: "O-",
                  selected: _controller.bloodGroup == "O-",
                  onTap: () => _controller.onBloodGroupChange("O-"),
                ), GroupView(
                  type: "AB+",
                  selected: _controller.bloodGroup == "AB+",
                  onTap: () => _controller.onBloodGroupChange("AB+"),
                ), GroupView(
                  type: "AB-",
                  selected: _controller.bloodGroup == "AB-",
                  onTap: () => _controller.onBloodGroupChange("AB-"),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

class GroupView extends GetView {
  final String type;
  final void Function() onTap;
  final bool selected;

  GroupView({required this.type, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          selected ? AppColors.primaryColor : Get.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          alignment: Alignment.center,
          width: 60,
          height: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            type,
            style: TextStyle(
              color: selected? AppColors.blockOrWhite : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
