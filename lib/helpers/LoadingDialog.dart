import 'package:flutter/material.dart';
import 'package:x_well/constants/app_colors.dart';

class LoadingDialog extends StatelessWidget {
  final String text;
  const LoadingDialog({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(width: 10,),

            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                strokeWidth: 2.5,
              ),
            ),

            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
