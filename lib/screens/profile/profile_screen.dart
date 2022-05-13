import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/screens/booking/views/app_list_tile_view.dart';
import 'package:x_well/screens/profile/controllers/profile_controller.dart';
import 'package:x_well/screens/profile/views/contact_view.dart';
import 'package:x_well/screens/profile/views/profile_top_view.dart';
import 'package:x_well/screens/profile/views/weight_height_blood_view.dart';
import 'package:x_well/screens/sign_in/controllers/sign_in_controller.dart';

import '../../helpers/loading.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileController _controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return _controller.user == null
              ? Center(
                  child: loading(),
                )
              : Column(
                  children: [
                    ProfileTopView(),
                    WeightHeightBloodGroupView(),
                    ContactView(),
                    AppListTileView(
                      title: "Upcoming Appointments",
                      iconData: FontAwesomeIcons.calendarAlt,
                      onClick: () => _controller.gotoAppointments("Upcoming"),
                    ),
                    AppListTileView(
                      title: "Appointments History",
                      iconData: FontAwesomeIcons.history,
                      onClick: () => _controller.gotoAppointments("History"),
                    ),

                    Flexible(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                primary: AppColors.primaryColor
                            ),
                            onPressed: Get.find<SignInController>().signOut,
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.signOutAlt,
                                  color: AppColors.blockOrWhite,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      color: AppColors.blockOrWhite,
                                      fontSize: 16,
                                     ),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                );
        }),
      ),
    );
  }
}
