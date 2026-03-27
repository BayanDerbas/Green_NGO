import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/config/app_builder.dart';
import '../../../../../core/services/rest_api/rest_api.dart';
import '../../../../core/style/repo.dart';
import '../models/beneficiary_model.dart';

class AddBeneficiarieController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final api = APIService.instance;
  final app = Get.find<AppBuilder>();

  final nameController= TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();
  final familyCountController = TextEditingController();
  final incomeController = TextEditingController();
  final incomeAfterController = TextEditingController();
  final nationalController = TextEditingController();
  final ageController = TextEditingController();

  var gender = Rxn<String>();
  var region = Rxn<String>();
  var socialStatus = Rxn<String>();
  var education = Rxn<String>();

  final genders = ["male", "female"];
  final regions = [
    "دمشق","حلب","حمص","اللاذقية","السويداء",
    "دير الزور","الرقة","ريف دمشق","ريف حلب","ريف حمص"
  ];

  final socialStatuses = ["single", "married", "divorced", "widowed"];

  final educationLevels = [
    "illiterate","primary","secondary","highschool","university","higher"
  ];

  var loading = false.obs;

  late int beneficiaryId;

  @override
  void onInit() {
    beneficiaryId = Get.arguments ?? 0;
    super.onInit();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      birthDateController.text =
          "${date.year}-${date.month}-${date.day}";
    }
  }

 Future<void> saveBeneficiary() async {
  if (!formKey.currentState!.validate()) return;

  final id = int.tryParse(nameController.text);

  if (id == null) {
    Get.snackbar("خطأ", "الرجاء إدخال ID صحيح");
    return;
  }

  if (gender.value == null ||
      region.value == null ||
      socialStatus.value == null ||
      education.value == null) {
    Get.snackbar("خطأ", "يرجى تعبئة جميع الحقول");
    return;
  }

  loading.value = true;

  final request = AddBeneficiaryRequest(
    gender: gender.value!,
    dateOfBirth: birthDateController.text,
    nationalId: nationalController.text,
    age: int.tryParse(ageController.text) ?? 0,
    region: region.value!,
    address: addressController.text,
    maritalStatus: socialStatus.value!,
    familySize: int.tryParse(familyCountController.text) ?? 0,
    educationLevel: education.value!,
    incomeBefore: double.tryParse(incomeController.text) ?? 0,
    incomeAfter: double.tryParse(incomeAfterController.text) ?? 0,
    employmentStatus: "employed",
  );

  final response = await api.request(
    Request(
      endPoint: EndPoints.update_beneficiary(id),
      method: RequestMethod.post,
      header: {
        "Authorization": "Bearer ${app.token}",
        "Accept": "application/json",
      },
      body: request.toJson(),
      fromJson: (json) => json,
    ),
  );

  loading.value = false;

  if (!response.success) {
    Get.snackbar("خطأ", response.message);
    return;
  }

  Get.snackbar("نجاح", "تم تسجيل البيانات بنجاح",colorText: StyleRepo.glowGreen);

  clearTextFieldsOnly();
}

  void clearTextFieldsOnly() {
    birthDateController.clear();
    addressController.clear();
    familyCountController.clear();
    incomeController.clear();
    incomeAfterController.clear();
    nationalController.clear();
    ageController.clear();
  }

  @override
  void onClose() {
    birthDateController.dispose();
    addressController.dispose();
    familyCountController.dispose();
    incomeController.dispose();
    incomeAfterController.dispose();
    nationalController.dispose();
    ageController.dispose();
    super.onClose();
  }
}