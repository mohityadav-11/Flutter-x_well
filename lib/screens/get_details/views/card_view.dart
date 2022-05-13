import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class CardView extends GetView {
  CardView({Key? key, required this.title, required this.child}) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Container(
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 6.0,bottom: 6.0,left: 15),
            margin: EdgeInsets.only(bottom: 10,),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)
              ),
            ),
            child: Text(
              title+":",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.blockOrWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),

          SizedBox(height: 5,)
        ],
      ),
    );
  }
}
