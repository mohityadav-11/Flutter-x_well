import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/screens/doctors/controllers/doctors_controller.dart';
import 'package:x_well/screens/doctors/views/doctors_list.dart';
import 'package:x_well/widgets/app_bar_view.dart';

class DoctorsScreen extends StatelessWidget {

  DoctorsScreen({Key? key,}) : super(key: key);

  final DoctorsController _controller = Get.find<DoctorsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            AppBarView(_controller.category + " Specialists"),

            DoctorsListView(),

          ],
        ),
      ),
    );
  }
}
