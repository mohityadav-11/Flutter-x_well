import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/get_details/views/card_view.dart';

import '../controllers/get_details_controller.dart';

class NameView extends GetView {
  NameView({Key? key}) : super(key: key);
  final GetDetailsController _controller = Get.find<GetDetailsController>();

  @override
  Widget build(BuildContext context) {
    return CardView(
      title: "Full Name",
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: _controller.onNameChange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: "Full Name",
        ),
      ),
    );

  }
}
