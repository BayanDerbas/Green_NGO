import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../../core/config/app_builder.dart';
import '../../../../../core/services/rest_api/rest_api.dart';
import '../model/beneficiary_model.dart';

class AllBeneficiariesController extends GetxController {
  final selectedFilter = "all".obs;
  final search = "".obs;

  static const tag = "beneficiariesPager";

  Future<ResponseModel> getAllBeneficiaries(
    int page,
    CancelToken cancel,
  ) async {
    final app = Get.find<AppBuilder>();
    final token = app.token;

    try {
      final response = await APIService.instance.request(
        Request(
          endPoint: EndPoints.all_beneficiaries(page),
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

        if (page == 1) {
          await app.saveBeneficiaries(list);
        }

        response.data = list;
        return response;
      } else {
        return _loadFromCache(app);
      }
    } catch (e) {
      return _loadFromCache(app);
    }
  }

  
  ResponseModel _loadFromCache(AppBuilder app) {
    final cached = app.getCachedBeneficiaries();

    return ResponseModel(success: true, data: cached, message: "offline data");
  }

  BeneficiaryModel fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel.fromJson(json);
  }

  Future<List<BeneficiaryModel>> getLastThreeBeneficiaries() async {
    final response = await getAllBeneficiaries(1, CancelToken());

    if (response.success && response.data.isNotEmpty) {
      List list = response.data;

      List<BeneficiaryModel> beneficiaries = list
          .map((e) => BeneficiaryModel.fromJson(e))
          .toList();
      return beneficiaries.take(3).toList();
    }

    return [];
  }

  void setFilter(String value) {
    selectedFilter.value = value;
  }
}
