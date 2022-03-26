
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnack {
  static void showSnackBar(
      {required String title, required String message, required Color backgroundColor}) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM);
  }
}
