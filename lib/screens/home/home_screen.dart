import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_well/screens/home/controllers/home_controller.dart';
import 'package:x_well/screens/home/views/appointments_view.dart';
import 'package:x_well/screens/home/views/categories_view.dart';
import 'package:x_well/screens/home/views/home_appbar_view.dart';

import '../../constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            HomeAppbarView(),


            Obx((){
              return _controller.appointments.length == 0
                  ? Container()
                  : AppointmentsView(appointment: _controller.appointments[0],);
            }),


            Container(
              padding: EdgeInsets.all(3.0),
              margin: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              child: Text(
                "Find your desired \n  Doctor Right Now!",
                style: GoogleFonts.kalam(
                    color: AppColors.primaryColor, fontSize: 29),
              ),
            ),


            CategoryView(),


          ],
        ),
      ),
    );
  }
}
