import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/screens/get_details/controllers/get_details_controller.dart';
import 'package:x_well/screens/get_details/views/age_view.dart';
import 'package:x_well/screens/get_details/views/blood_group_view.dart';
import 'package:x_well/screens/get_details/views/contact_details_view.dart';
import 'package:x_well/screens/get_details/views/gender_details_view.dart';
import 'package:x_well/screens/get_details/views/height_view.dart';
import 'package:x_well/screens/get_details/views/name_view.dart';
import 'package:x_well/screens/get_details/views/weight_view.dart';

class GetDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final GetDetailsController _controller= Get.find<GetDetailsController>();

    return Scaffold(
      //backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Enter your Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),),
                ),

                NameView(),
                SizedBox(height: 5,),
                AgeView(),
                SizedBox(height: 5,),
                WeightView(),
                SizedBox(height: 5,),
                HeightView(),
                SizedBox(height: 5,),
                GenderDetailsView(),
                SizedBox(height: 5,),
                BloodGroupView(),
                SizedBox(height: 5,),
                ContactDetailsView(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx((){
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _controller.isEnabled? _controller.onClick : null,
            child: Text("Continue"),
            style: ElevatedButton.styleFrom(
              primary: AppColors.primaryColor,
              onSurface: AppColors.primaryColor,
            ),
          ),
        );
      }),
    );
  }
}
