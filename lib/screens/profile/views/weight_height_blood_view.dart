import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../controllers/profile_controller.dart';

class WeightHeightBloodGroupView extends GetView {
  WeightHeightBloodGroupView({Key? key}) : super(key: key);

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
        child: Obx((){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxView(icon: _controller.user!.gender == "Male" ? Icons.male_outlined : Icons.female_outlined, label: _controller.user!.gender,),
              BoxView(icon: Icons.bloodtype_outlined, label: _controller.user!.bloodGroup,),
              BoxView(icon: Icons.monitor_weight_outlined, label: _controller.user!.weight.toString()  + "Kg",),
              BoxView(icon: Icons.height_outlined, label: _controller.user!.height.toString()+ "cm",),
            ],
          );
        }),
      ),
    );
  }
}


class BoxView extends GetView {
  const BoxView({Key? key, required this.icon, required this.label,}) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            child: Icon(
              icon,
              size: 29,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 10,),

          Text(label,style: TextStyle(
            fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
          ),)
        ],
      ),
    );
  }
}

