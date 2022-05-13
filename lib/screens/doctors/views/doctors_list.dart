import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/screens/doctors/views/doc_card_view.dart';

import '../../../helpers/loading.dart';
import '../controllers/doctors_controller.dart';

class DoctorsListView extends GetView {
  DoctorsListView({Key? key,}) : super(key: key);

  final DoctorsController _controller = Get.find<DoctorsController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return _controller.isLoading ? Center(child: loading(),)
          : _controller.doctors.length==0?Center(
        child: Text("No doctors are available in this Category"),
      ) : Expanded(child: ListView(
        children: _controller.doctors.map((doctor) => DocCardView(doctor: doctor,)).toList(),
      ));
    });
  }
}
