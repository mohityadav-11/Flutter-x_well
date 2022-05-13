import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/screens/booking/views/select_time_view.dart';
import 'package:x_well/screens/booking/views/select_type.dart';
import 'package:x_well/screens/booking/views/title_view.dart';
import 'package:x_well/screens/profile/views/sheet_top_view.dart';

import '../controllers/booking_controller.dart';

appointmentSheet() {
  final BookingController _controller = Get.find<BookingController>();

  return Get.bottomSheet(
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SheetTopView(),
          Obx(() {
            return SelectType(
              controller: _controller,
              type: _controller.type,
            );
          }),
          TitleView(title: "Select Date:"),
          FlutterDatePickerTimeline(
            selectedItemBackgroundColor: AppColors.primaryColor,
            unselectedItemBackgroundColor: Get.theme.scaffoldBackgroundColor,
            selectedItemTextStyle: TextStyle(color: AppColors.blockOrWhite),
            unselectedItemTextStyle: TextStyle(
              color: AppColors.primaryColor,
            ),
            startDate: DateTime.now().add(Duration(days: 1)),
            endDate: DateTime.now().add(Duration(days: 30)),
            initialSelectedDate: DateTime.now().add(Duration(days: 1)),
            onSelectedDateChange: _controller.onDateChange,
          ),
          Obx(() {
            return SelectTimeView(
                controller: _controller, selected: _controller.time, date: _controller.date,);
          }),
          Obx(() {
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _controller.buttonEnabled ? _controller.onBook : null,
                child: Text("Book",style: TextStyle(
                  fontSize: 16
                ),),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    onPrimary: AppColors.blockOrWhite,
                    onSurface: AppColors.primaryColor),
              ),
            );
          }),
        ],
      ),
    ),
    elevation: 10,
  );
}
