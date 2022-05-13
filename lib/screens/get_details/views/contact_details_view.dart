import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/get_details/views/card_view.dart';

import '../controllers/get_details_controller.dart';

class ContactDetailsView extends GetView {
  ContactDetailsView({Key? key}) : super(key: key);
  final GetDetailsController _controller = Get.find<GetDetailsController>();

  @override
  Widget build(BuildContext context) {
    return CardView(
      title: "Contact Details",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: _controller.onNumberChange,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: "Phone",
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            enabled: false,
            style: TextStyle(
              color: Colors.grey
            ),
            initialValue: FirebaseAuth.instance.currentUser!.email,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: "Email",
            ),
          ),
        ],
      ),
    );
  }
}
