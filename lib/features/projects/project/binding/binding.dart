import 'package:get/get.dart';
import '../controller/controller.dart';

class MonitoringProjectBinding extends Bindings {
  final int projectId;

  MonitoringProjectBinding({required this.projectId});

  @override
  void dependencies() {
    Get.lazyPut<MonitoringProjectController>(
      () => MonitoringProjectController(projectId),
    );
  }
}