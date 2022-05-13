import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/booking/views/title_view.dart';

import '../controllers/booking_controller.dart';
import 'button_vew.dart';

class SelectTimeView extends GetView {

  final BookingController controller;
  final String selected;
  final DateTime date;

  SelectTimeView({required this.controller, required this.selected, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TitleView(title: "Select Time:"),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonView(
              selected: selected == TimeSlots.AM_11,
              onPressed: controller.isTimeTaken(TimeSlots.AM_11)
                  ? null
                  : () => controller.selectTime(TimeSlots.AM_11),
              title: TimeSlots.AM_11,
            ),

            ButtonView(
              selected: selected == TimeSlots.PM_12,
              onPressed: controller.isTimeTaken(TimeSlots.PM_12)
                  ? null
                  : () => controller.selectTime(TimeSlots.PM_12),
              title: TimeSlots.PM_12,
            ),

            ButtonView(
              selected: selected == TimeSlots.PM_01,
              onPressed: controller.isTimeTaken(TimeSlots.PM_01)
                  ? null
                  : () => controller.selectTime(TimeSlots.PM_01),
              title: TimeSlots.PM_01,
            ),

          ],
        ),

        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonView(
              selected: selected == TimeSlots.PM_02,
              onPressed: controller.isTimeTaken(TimeSlots.PM_02)
                  ? null
                  : () => controller.selectTime(TimeSlots.PM_02),
              title: TimeSlots.PM_02,
            ),

            ButtonView(
              selected: selected == TimeSlots.PM_03,
              onPressed: controller.isTimeTaken(TimeSlots.PM_03)
                  ? null
                  : () => controller.selectTime(TimeSlots.PM_03),
              title: TimeSlots.PM_03,
            ),

            ButtonView(
              selected: selected == TimeSlots.PM_04,
              onPressed: controller.isTimeTaken(TimeSlots.PM_04)
                  ? null
                  : () => controller.selectTime(TimeSlots.PM_04),
              title: TimeSlots.PM_04,
            ),

          ],
        )

      ],
    );
  }
}

class TimeSlots {

  static String get AM_11 => "11:00 AM";

  static String get PM_12 => "12:00 PM";

  static String get PM_01 => "01:00 PM";

  static String get PM_02 => "02:00 PM";

  static String get PM_03 => "03:00 PM";

  static String get PM_04 => "04:00 PM";


}