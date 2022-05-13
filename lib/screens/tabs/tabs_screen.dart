import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/app_colors.dart';

import 'controllers/tabs_controller.dart';

class TabsScreen extends StatelessWidget {
  TabsScreen({Key? key}) : super(key: key);

  final TabsController _controller = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
          tabBar: CupertinoTabBar(
            activeColor: AppColors.primaryColor,
            iconSize: 25,
            inactiveColor: Colors.grey,
            items: _controller.tabItems(),
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(builder: (context) => _controller.getScreen(index));
          },
        ),
      ),
    );
  }
}
