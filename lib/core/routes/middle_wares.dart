import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_org/core/routes/routes.dart';
import '../config/app_builder.dart';

class BlockGuestMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final app = Get.find<AppBuilder>();
    if (app.isLoggedIn) {
      return RouteSettings(name: Pages.dashboard.route);
    }
    return null;
  }
}
