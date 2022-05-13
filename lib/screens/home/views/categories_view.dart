import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../get_details/views/small_box_view.dart';
import '../../profile/views/p_card_view.dart';
import '../controllers/home_controller.dart';

class CategoryView extends GetView{

  final HomeController _controller = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {

    return PCardView(
      title: "Categories",
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallBoxView(
                  icon: FontAwesomeIcons.eye,
                  label: "Eye",
                  onTap: () => _controller.gotoDoctorsScreen("Eye")),
              SmallBoxView(
                  icon: FontAwesomeIcons.heartbeat,
                  label: "Heart",
                  onTap: () => _controller.gotoDoctorsScreen("Heart")),
              SmallBoxView(
                  icon: FontAwesomeIcons.brain,
                  label: "Brain",
                  onTap: () => _controller.gotoDoctorsScreen("Brain")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallBoxView(
                  icon: CupertinoIcons.ear,
                  label: "Ear",
                  onTap: () => _controller.gotoDoctorsScreen("Ear")),
              SmallBoxView(
                  icon: FontAwesomeIcons.baby,
                  label: "Babies",
                  onTap: () => _controller.gotoDoctorsScreen("Babies")),
              SmallBoxView(
                  icon: FontAwesomeIcons.tooth,
                  label: "Teeth",
                  onTap: () => _controller.gotoDoctorsScreen("Teeth")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),

    );
  }

}