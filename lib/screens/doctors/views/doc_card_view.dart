import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/app_colors.dart';
import 'package:x_well/models/doctor.dart';

import '../../../helpers/loading.dart';
import '../controllers/doctors_controller.dart';

class DocCardView extends GetView {
  final DoctorsController _controller = Get.find<DoctorsController>();
  final Doctor doctor;

  DocCardView({Key? key, required this.doctor, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.maxFinite,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () => _controller.gotoBookingScreen(doctor),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: doctor.url,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) => Center(child: loading(),),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. " + doctor.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Flexible(
                              child: Text(
                            doctor.address1 +
                                " " +
                                doctor.address2 +
                                ", " +
                                doctor.city,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                height: 100,
                child: Text("Fee: \n\$500",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
