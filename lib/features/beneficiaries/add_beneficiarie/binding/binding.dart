import 'package:get/get.dart';
import '../controller/controller.dart';

class AddBeneficiarieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBeneficiarieController>(
      () => AddBeneficiarieController(),
    );
  }
}