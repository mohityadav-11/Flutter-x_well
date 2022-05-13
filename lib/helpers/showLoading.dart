import 'package:get/get.dart';

import 'LoadingDialog.dart';



/// loading
showLoading(){
  Get.dialog(
    LoadingDialog(text: "Saving Details"),
    useSafeArea: true,
    barrierDismissible: false,
  );
}

/// close dialog
dismissLoading(){
  Get.back();
}

