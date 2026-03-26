import 'package:get/get.dart';

import '../services/rest_api/api_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<APIService>(APIService(), permanent: true);
  }
}
