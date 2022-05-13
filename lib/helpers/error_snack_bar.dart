import 'package:get/get.dart';
import 'package:flutter/material.dart';

errorSnackBar(String error) {
  Get.snackbar(
    "Invalid Input",
    error,
    margin: EdgeInsets.all(15),
    icon: Icon(Icons.error_outline, color: Colors.red),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Get.theme.scaffoldBackgroundColor,
  );
}

successful_booking(){
  Get.snackbar(
    "Successful",
    "Appointment booked successfully.",
    margin: EdgeInsets.all(15),
    icon: Icon(Icons.check_circle_outline, color: Colors.green),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Get.theme.scaffoldBackgroundColor,
  );
}

failed_booking() {
  Get.snackbar(
    "Failed",
    "Something went wrong, Please try again later",
    margin: EdgeInsets.all(15),
    icon: Icon(Icons.error_outline, color: Colors.red),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Get.theme.scaffoldBackgroundColor,
  );
}

