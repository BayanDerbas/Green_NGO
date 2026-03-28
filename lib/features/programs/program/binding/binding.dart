import 'package:get/get.dart';
import '../controller/controller.dart';

class MonitoringProgramBinding extends Bindings {
  final int programId;

  MonitoringProgramBinding({required this.programId});

  @override
  void dependencies() {
    Get.lazyPut<MonitoringProgramController>(
      () => MonitoringProgramController(programId),
    );
  }
}