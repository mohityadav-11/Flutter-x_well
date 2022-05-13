import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/screens/booking/controllers/booking_controller.dart';
import 'package:x_well/screens/booking/views/appointment_view.dart';
import 'package:x_well/screens/profile/views/p_card_view.dart';

import '../../helpers/loading.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({Key? key}) : super(key: key);

  final BookingController _controller = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.maxFinite,
                      child: CachedNetworkImage(
                        imageUrl: _controller.doctor.url,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: loading(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    BackButton(
                      onPressed: () => Get.back(),
                      color: AppColors.primaryColor,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(left: 15,top: 5),
                        color: Colors.lightGreen.withOpacity(0.5),
                        child: Text(
                          "Dr. " + _controller.doctor.name,
                          style: GoogleFonts.kalam(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PCardView(
                title: "About:",
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("MBBS, MD - General Medicine"),
                      Text("${_controller.category} specialist"),
                      Text("25 Years Experience Overall  (14 years as specialist)"),
                      SizedBox(height: 10,),

                      Text(
                        "Dr. ${_controller.doctor.name} is a ${_controller.category.toLowerCase()} specialist in ${_controller.doctor.city}, And has an experience of 25 years in this field. Dr. ${_controller.doctor.name} is completed MBBS from Albert Einstein College of Medicine, Bronx, New York in 1996,MD - General Medicine from Stony Brook University in 2001",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  )
                ),
              ),
              PCardView(
                  title: "Contact:",
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.phone,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _controller.doctor.number.toString(),
                              style: TextStyle(
                                  color: AppColors.primaryColor, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                _controller.doctor.address1 +
                                    ", " +
                                    _controller.doctor.address2 +
                                    ", " +
                                    _controller.doctor.city +
                                    ", " +
                                    _controller.doctor.country,
                                style: TextStyle(
                                    color: AppColors.primaryColor, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),

              Container(
                padding: EdgeInsets.all(8.0),
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    primary: AppColors.primaryColor,
                    onPrimary: AppColors.blockOrWhite
                  ),
                  child: Text("Schedule appointment"),
                  onPressed: () => appointmentSheet(),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
