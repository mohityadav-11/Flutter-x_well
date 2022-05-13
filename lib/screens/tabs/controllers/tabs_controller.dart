import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/home/home_screen.dart';
import 'package:x_well/screens/profile/profile_screen.dart';

import '../../../theme/theme_service.dart';


class TabsController extends GetxController {

  /// for theme change
  RxBool _isDark = new RxBool(Get.isDarkMode);
  bool get isDark => _isDark.value;

  toggleTheme(value){
    ThemeService().switchTheme();
    _isDark.value = value;
  }

  getScreen(int index) {
    switch (index) {

    /// return home screen
      case 0:
        return HomeScreen();

    /// return trending screen

      case 1:
        return ProfileScreen();


    }
  }

  List<BottomNavigationBarItem> tabItems(){
    return  [
      BottomNavigationBarItem(icon: Icon(Icons.home)),
      BottomNavigationBarItem(icon: Icon(Icons.person)),
    ];
  }




}
