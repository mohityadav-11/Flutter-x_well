import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/helpers/loading.dart';
import 'package:x_well/screens/home/controllers/home_controller.dart';
import 'package:x_well/screens/profile/views/p_card_view.dart';

class VaccinationDetailsView extends GetView {
  VaccinationDetailsView({Key? key}) : super(key: key);

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PCardView(
        title: "Covid Vaccination Status:",
        child: _controller.loading
            ? Center(
                child: loading(),
              )
            : _controller.vaccine == null
                ? Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          //primary: Colors.lightGreen[100],
                          primary: AppColors.primaryColor),
                      child: Text(
                        "Add your vaccination details",
                        style: TextStyle(),
                      ),
                      onPressed: () {},
                    ),
                  )
                : Column(
          children: [
            Text("Add you vaccination details:"),
            TextFormField(
              keyboardType: TextInputType.datetime,
            )
          ],
        ),
      );
    });
  }
}
