import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:x_well/constants/app_colors.dart';

import '../controllers/profile_controller.dart';

class ProfileTopView extends GetView {

  final ProfileController _controller = Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.maxFinite,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.primaryColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Get.theme.scaffoldBackgroundColor,
                  child: Icon(Icons.person,
                    color: AppColors.primaryColor,
                    size: 45,
                  ),
                ),
              ),

              Obx((){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(_controller.user!.name,
                        style: TextStyle(
                            color: Get.theme.scaffoldBackgroundColor,
                            fontSize: 26
                        ),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text("Age: "+_controller.user!.age.toString(),
                        style: TextStyle(
                            color: Get.theme.scaffoldBackgroundColor,
                            fontSize: 14
                        ),),
                    ),
                  ],
                );
              }),

            ],
          ),
        ),
      ),
    );
  }

}