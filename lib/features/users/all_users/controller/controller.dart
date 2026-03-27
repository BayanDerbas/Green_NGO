import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:green_org/features/users/all_users/model/user_model.dart';
import '../../../../core/config/app_builder.dart';
import '../../../../core/services/rest_api/rest_api.dart';

class AllUsersController extends GetxController {
  static const tag = "ALL_USERS";

  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  Future<ResponseModel> getAllUsers(int page, CancelToken cancel) async {
    final response = await api.request(
      Request(
        endPoint: EndPoints.all_users(page),
        method: RequestMethod.get,
        cancelToken: cancel,
        header: {
          "Authorization": "Bearer ${app.token}",
          "Accept": "application/json",
        },
        fromJson: (json) => json,
      ),
    );

    if (!response.success) {
      final cached = app.getCachedUsers();
      return ResponseModel(
        success: true,
        data: cached.map((e) => e.toJson()).toList(),
        message: '',
      );
    }

    final rawData = response.data;
    final List<Map<String, dynamic>> list =
        (rawData is Map<String, dynamic> ? rawData['data'] : rawData)
            .cast<Map<String, dynamic>>()
            .toList();

    if (page == 1) {
      final users = list.map((e) => UserModel.fromJson(e)).toList();
      await app.saveUsers(users);
    }

    return ResponseModel(success: true, data: list, message: '');
  }

  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
