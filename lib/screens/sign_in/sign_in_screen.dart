import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';
import 'package:x_well/helpers/loading.dart';
import 'package:x_well/screens/sign_in/controllers/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController _controller = Get.find<SignInController>();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png"),
            ),
            Obx(() {
              return Align(
                alignment: Alignment.bottomCenter,
                child: _controller.isLoading
                    ? Container(
                        height: 80,
                        padding: EdgeInsets.all(10),
                        child: loading())
                    : Container(
                        padding: EdgeInsets.all(10),
                        width: double.maxFinite,
                        child: SignInButton(
                            buttonType: ButtonType.google,
                            onPressed: _controller.googleSignInMethod),
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}
