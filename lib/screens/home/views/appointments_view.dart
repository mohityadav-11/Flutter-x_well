import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:x_well/models/appointment.dart';
import 'package:x_well/screens/booking/views/select_type.dart';
import 'package:x_well/screens/profile/views/p_card_view.dart';

import '../../../constants/app_colors.dart';

class AppointmentsView extends GetView {

  final Appointment appointment;

  AppointmentsView({required this.appointment});


  @override
  Widget build(BuildContext context) {
    return PCardView(
      title: appointment.type,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Upcoming appointment with Dr. "
                "${appointment.docName} for ${appointment.category.toLowerCase()}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          if(appointment.type == AppointmentType.ON_SITE)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                Text(
                  appointment.location,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          if(appointment == AppointmentType.ON_SITE)
            SizedBox(
              height: 10,
            ),
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 8.0,
              bottom: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
            child: Text(
              "On ${DateFormat('EEEE').format(appointment.date!)}, "
                  "${DateFormat('MMM').format(appointment.date!)} "
                  "${appointment.date!.day}"
                  " at ${appointment.time}",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.blockOrWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
