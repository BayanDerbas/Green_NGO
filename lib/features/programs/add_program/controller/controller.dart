import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';
import '../../../../core/config/app_builder.dart';
import '../../../../core/services/rest_api/rest_api.dart';
import '../model/program_create_model.dart';

class AddProgramController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final typeController = TextEditingController();
  final minAgeController = TextEditingController();
  final maxAgeController = TextEditingController();
  final genderController = TextEditingController();
  final locationController = TextEditingController();
  final budgetController = TextEditingController();
  final spentBudgetController = TextEditingController();
  final statusController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final projectIdController = TextEditingController();
  final managerIdController = TextEditingController();

  final programTypes = [
    "entrepreneurship",
    "vocational_training",
    "community_leadership",
    "psychosocial_support",
    "economic_empowerment",
    "agricultural_development",
  ];
  var programType = Rxn<String>();

  Future<void> createProgram() async {
    if (!formKey.currentState!.validate()) return;

    final model = ProgramCreateModel(
      name: nameController.text,
      description: descriptionController.text,
      type: programType.toString(),
      targetAgeMin: int.parse(minAgeController.text),
      targetAgeMax: int.parse(maxAgeController.text),
      targetGender: genderController.text,
      location: locationController.text,
      totalBudgetUsd: double.parse(budgetController.text),
      spentBudgetUsd: double.parse(spentBudgetController.text),
      status: statusController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
      projectId: int.parse(projectIdController.text),
      programManagerId: int.parse(managerIdController.text),
    );

    final request = Request(
      endPoint: EndPoints.create_program,
      method: RequestMethod.post,
      body: model.toJson(),
      header: {
        "Authorization": "Bearer ${app.token}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );

    ResponseModel response = await APIService.instance.request(request);

    if (response.success) {
      Get.snackbar(
        "نجاح",
        "تم إنشاء البرنامج بنجاح",
        colorText: StyleRepo.glowGreen,
      );
      Get.back();
    } else {
      Get.snackbar(
        "خطأ",
        response.message ?? "حدث خطأ غير معروف",
        colorText: StyleRepo.glowGreen,
      );
    }
  }
}
