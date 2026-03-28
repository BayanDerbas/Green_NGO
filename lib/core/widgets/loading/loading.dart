import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_org/core/style/repo.dart';

abstract class Loading {
  static void show() {
    Get.dialog(
      Center(child: CircularProgressIndicator(
        color: StyleRepo.glowGreen,
      )),
      barrierDismissible: false,
    );
  }

  static void close() {
    Get.back();
  }
}
