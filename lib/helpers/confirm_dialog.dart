import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:x_well/constants/app_colors.dart';

import '../screens/booking/controllers/booking_controller.dart';

confirmDialog() {
  final BookingController _controller = Get.find<BookingController>();

  return Get.dialog(
    ConfirmDialog(controller: _controller),
    useSafeArea: true,
    barrierDismissible: false,
  );
}

class ConfirmDialog extends GetView {
  final BookingController controller;

  const ConfirmDialog({required this.controller});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = controller.date;

    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              "${controller.type} appointment with Dr. ${controller.doctor.name} on ${DateFormat('EEEE').format(dateTime)}, ${DateFormat('MMM').format(dateTime)} ${dateTime.day} "
              "at ${controller.time}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Get.theme.scaffoldBackgroundColor,
                        onPrimary: AppColors.primaryColor),
                    child: Text("Cancel"),
                    onPressed: () => Get.back(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      onPrimary: AppColors.blockOrWhite,
                    ),
                    child: Text("Confirm"),
                    onPressed: controller.onBookingConfirm,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
