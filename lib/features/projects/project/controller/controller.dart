import 'package:get/get.dart';
import '../../../../core/config/app_builder.dart';
import '../../../../core/services/rest_api/rest_api.dart';
import '../model/program_details_model.dart';

class MonitoringProjectController extends GetxController {
  final int projectId;

  MonitoringProjectController(this.projectId);

  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  var program = Rxn<ProjectDetailsModel>();

  @override
  void onInit() {
    super.onInit();
    getProjectDetails();
  }

  Future<void> getProjectDetails() async {
    final token = app.token;

    try {
      final response = await api.request(
        Request(
          endPoint: EndPoints.project_details(projectId),
          method: RequestMethod.get,
          header: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
          fromJson: (json) => json,
        ),
      );

      if (response.success && response.data != null) {
        final data = response.data;

        final model = ProjectDetailsModel.fromJson(data);

        program.value = model;
        await app.saveProjectDetails(model);
      } else {
        _loadFromCache();
      }
    } catch (e) {
      _loadFromCache();
    }
  }

  void _loadFromCache() {
    final cached = app.getProjectDetails(projectId);

    if (cached != null) {
      program.value = cached;
    }
  }
}