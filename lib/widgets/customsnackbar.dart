import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static snackbar(String title, String message,IconData icon) {
    return Get.snackbar(title, message,
        messageText: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        backgroundColor: title == 'Success' ? Colors.green : Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
        icon:Icon(icon,color: Colors.white,size: 40,),
        leftBarIndicatorColor: Colors.white,
        margin: const EdgeInsets.all(20));
  }
}
