import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/profile/views/p_card_view.dart';

import '../../../constants/app_colors.dart';
import '../controllers/profile_controller.dart';

class ContactView extends GetView {

  final ProfileController _controller = Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {
    return PCardView(title: "Contact:", child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.phone,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _controller.user!.number.toString(),
                style: TextStyle(
                    color: AppColors.primaryColor, fontSize: 16),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.mail,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _controller.user!.email,
                style: TextStyle(
                    color: AppColors.primaryColor, fontSize: 16),
              )
            ],
          ),
        )
      ],
    ));
  }
}
