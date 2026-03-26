import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Loading {
  static void show() {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  static void close() {
    Get.back();
  }
}
