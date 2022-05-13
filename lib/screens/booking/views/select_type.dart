import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:x_well/screens/booking/controllers/booking_controller.dart';
import 'button_vew.dart';
import 'title_view.dart';

class SelectType extends GetView{

  final BookingController controller;
  final String type;
  SelectType({required this.controller, required this.type});


  @override
  Widget build(BuildContext context) {


    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleView(title: "Select Type:"),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ButtonView(
                  selected: type == AppointmentType.ON_SITE,
                  onPressed: () => controller.selectType(AppointmentType.ON_SITE),
                  title: AppointmentType.ON_SITE,
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonView(
                  selected: type == AppointmentType.ONLINE,
                  title: AppointmentType.ONLINE,
                  onPressed: () => controller.selectType(AppointmentType.ONLINE),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppointmentType {
  static String get ON_SITE => "On site";
  static String get ONLINE => "Online";
}