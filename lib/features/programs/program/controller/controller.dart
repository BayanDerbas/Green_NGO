import 'package:get/get.dart';
import '../../../../core/config/app_builder.dart';
import '../../../../core/services/rest_api/rest_api.dart';
import '../model/program_details_model.dart';

class MonitoringProgramController extends GetxController {
  final int programId;

  MonitoringProgramController(this.programId);

  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  var program = Rxn<ProgramDetailsModel>();

  @override
  void onInit() {
    super.onInit();
    getProgramDetails();
  }

  Future<void> getProgramDetails() async {
    final token = app.token;

    try {
      final response = await api.request(
        Request(
          endPoint: EndPoints.program_details(programId),
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

        final model = ProgramDetailsModel.fromJson(data);

        program.value = model;
        await app.saveProgramDetails(model);
      } else {
        _loadFromCache();
      }
    } catch (e) {
      _loadFromCache();
    }
  }

  void _loadFromCache() {
    final cached = app.getProgramDetails(programId);

    if (cached != null) {
      program.value = cached;
    }
  }
}