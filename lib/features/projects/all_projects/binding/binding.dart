import 'package:get/get.dart';
import '../controller/controller.dart';

class AllProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProjectsController>(
      () => AllProjectsController(),
      tag: AllProjectsController.tag,
    );
  }
}
