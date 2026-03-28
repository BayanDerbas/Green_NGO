import 'package:get/get.dart';
import '../controller/controller.dart';

class AddProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProgramController());
  }
}