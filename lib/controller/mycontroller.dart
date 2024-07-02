import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srashti/views/dashboard/dashboardpage.dart';

class Mycontroller extends GetxController {
  void showBottomSheet() {
    Get.bottomSheet(
      Dashboardpage(),
      backgroundColor: Colors.transparent,
      // isDismissible: false,
      // enableDrag: true,
      barrierColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20)))
    );
  }
}
