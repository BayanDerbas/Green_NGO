import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/config/app_builder.dart';
import '../../../../../core/services/rest_api/rest_api.dart';
import '../model/project_model.dart';

class AllProjectsController extends GetxController {
  static const tag = "ALL_PROJECTS";

  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  Future<ResponseModel> getProjects(
    int page,
    CancelToken cancel,
  ) async {
    final token = app.token;

    try {
      final response = await api.request(
        Request(
          endPoint: EndPoints.all_project(page),
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
          final projects = list
              .map((e) => ProjectModel.fromJson(e))
              .toList();

          await app.saveProjects(projects);
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
    final cached = app.getCachedProjects();

    return ResponseModel(
      success: true,
      data: cached.map((e) => e.toJson()).toList(),
      message: 'offline data',
    );
  }

  ProjectModel fromJson(Map<String, dynamic> json) {
    return ProjectModel.fromJson(json);
  }

  Future<List<ProjectModel>> getLastThreeProjects() async {
  try {
    final response = await getProjects(1, CancelToken());

    if (response.data is List) {
      final list = response.data as List;

      return list
          .map((e) => ProjectModel.fromJson(e))
          .take(3)
          .toList();
    }

    return [];
  } catch (e) {
    final cached = app.getCachedProjects();
    return cached.take(3).toList();
  }
}
}