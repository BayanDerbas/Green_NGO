import 'package:get/get.dart';
import '../controller/controller.dart';

class MonitoringBeneficiariesBinding extends Bindings {
  final int beneficiaryId;

  MonitoringBeneficiariesBinding({required this.beneficiaryId});

  @override
  void dependencies() {
    Get.lazyPut<MonitoringBeneficiariesController>(
      () => MonitoringBeneficiariesController(beneficiaryId),
    );
  }
}