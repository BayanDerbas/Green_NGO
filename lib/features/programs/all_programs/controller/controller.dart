import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/config/app_builder.dart';
import '../../../../../core/services/rest_api/rest_api.dart';
import '../model/program_models.dart';

class AllProgramsController extends GetxController {
  static const tag = "ALL_PROGRAMS";

  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  Future<ResponseModel> getPrograms(
    int page,
    CancelToken cancel,
  ) async {
    final token = app.token;

    try {
      final response = await api.request(
        Request(
          endPoint: EndPoints.all_programs(page),
          method: RequestMethod.get,
          cancelToken: cancel,
          header: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
          fromJson: (json) => json,
        ),
      );

      if (response.success) {
        List list;

        if (response.data is Map && response.data['data'] != null) {
          list = response.data['data'];
        } else if (response.data is List) {
          list = response.data;
        } else {
          list = [];
        }

        list = list.where((e) => e != null).toList();

        if (page == 1) {
          final programs = list
              .map((e) => ProgramModel.fromJson(e))
              .toList();

          await app.savePrograms(programs);
        }

        response.data = list; 

        return response;
      } else {
        return _loadFromCache();
      }
    } catch (e) {
      return _loadFromCache();
    }
  }

  ResponseModel _loadFromCache() {
    final cached = app.getCachedPrograms();

    return ResponseModel(
      success: true,
      data: cached.map((e) => e.toJson()).toList(),
      message: 'offline data',
    );
  }

  ProgramModel fromJson(Map<String, dynamic> json) {
    return ProgramModel.fromJson(json);
  }

  Future<List<ProgramModel>> getLastThreePrograms() async {
  try {
    final response = await getPrograms(1, CancelToken());

    if (response.data is List) {
      final list = response.data as List;

      return list
          .map((e) => ProgramModel.fromJson(e))
          .take(3)
          .toList();
    }

    return [];
  } catch (e) {
    final cached = app.getCachedPrograms();
    return cached.take(3).toList();
  }
}
}