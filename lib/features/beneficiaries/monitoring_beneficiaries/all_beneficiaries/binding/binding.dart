import 'package:get/get.dart';
import '../controller/controller.dart';

class AllBeneficiariesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllBeneficiariesController());
  }
}