import 'package:get/get.dart';
import '../controller/controller.dart';

class AllProgramsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProgramsController>(
      () => AllProgramsController(),
      tag: AllProgramsController.tag,
    );
  }
}
