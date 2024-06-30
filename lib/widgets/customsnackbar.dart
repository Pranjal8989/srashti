import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static snackbar(String title, String message) {
    return Get.snackbar(title, message,
        messageText: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        backgroundColor: title == 'Success' ? Colors.deepPurple : Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20));
  }
}
