import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/screens/AppointmentsList/controllers/appointments_list_controller.dart';
import 'package:x_well/screens/home/views/appointments_view.dart';

import '../../widgets/app_bar_view.dart';

class AppointmentsListScreen extends StatelessWidget {
  const AppointmentsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppointmentsListController _controller =
        Get.find<AppointmentsListController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarView(_controller.detail),
            Obx(() {
              return Expanded(
                child: _controller.appointments.length == 0
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text("You don't have any appointment.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20
                          ),),
                        ),
                    )
                    : ListView(
                        children: _controller.appointments
                            .map((e) => AppointmentsView(appointment: e))
                            .toList(),
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}
