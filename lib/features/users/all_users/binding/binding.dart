import 'package:get/get.dart';

import '../controller/controller.dart';

class AllUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(
      () => AllUsersController(),
      tag: AllUsersController.tag,
    );
  }
}