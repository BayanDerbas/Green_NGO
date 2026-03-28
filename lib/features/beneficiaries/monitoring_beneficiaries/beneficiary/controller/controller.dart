import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_org/core/style/repo.dart';
import '../../../../../core/config/app_builder.dart';
import '../../../../../core/services/rest_api/rest_api.dart';
import '../model/beneficiary_details.dart';

class MonitoringBeneficiariesController extends GetxController {
  final int beneficiaryId;

MonitoringBeneficiariesController(this.beneficiaryId);

  RxBool isEditing = false.obs;

  var beneficiary = Rxn<BeneficiaryDetails>();

  final name = TextEditingController();
  final gender = TextEditingController();
  final regoin = TextEditingController();
  final address = TextEditingController();
  final birthDate = TextEditingController();
  final maritalStatus = TextEditingController();
  final age = TextEditingController();
  final familyMembers = TextEditingController();
  final education = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final incomeBefore = TextEditingController();
  final incomeAfter = TextEditingController();
  final notes = TextEditingController();
  final nationalId = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchBeneficiaryDetails();
  }

  void showView() => isEditing.value = false;
  void showEdit() => isEditing.value = true;

  Future<void> fetchBeneficiaryDetails() async {
    final app = Get.find<AppBuilder>();
    final token = app.token;

    final response = await APIService.instance.request(Request(
      endPoint: EndPoints.beneficiary_details(beneficiaryId),
      method: RequestMethod.get,
      header: {"Authorization": "Bearer $token", "Accept": "application/json"},
      fromJson: (json) => json,
    ));

    if (response.success && response.data != null) {
      beneficiary.value = BeneficiaryDetails.fromJson(response.data);

      final b = beneficiary.value!;
      name.text = b.user.fullName;
      gender.text = b.gender;
      birthDate.text = b.dateOfBirth;
      maritalStatus.text = b.maritalStatus;
      age.text = b.age.toString();
      familyMembers.text = b.familySize.toString();
      education.text = b.educationLevel;
      phone.text = b.user.phone;
      email.text = b.user.email;
      incomeBefore.text = b.incomeBefore.toString();
      incomeAfter.text = b.incomeAfter.toString();
      notes.text = "";
      nationalId.text = b.nationalId;
      regoin.text = b.region;
      address.text = b.address;
    }
  }
  Future<void> updateBeneficiaryDetails() async {
  final app = Get.find<AppBuilder>();
  final token = app.token;

  final body = {
    "gender": gender.text,
    "date_of_birth": birthDate.text,
    "national_id": nationalId.text,
    "region": regoin.text,
    "address": address.text,
    "marital_status": maritalStatus.text,
    "family_size": int.tryParse(familyMembers.text) ?? 0,
    "education_level": education.text,
    "income_before": double.tryParse(incomeBefore.text) ?? 0.0,
    "income_after": double.tryParse(incomeAfter.text) ?? 0.0,
  };
String formatDate(String input) {
  try {
    final parts = input.split('/');
    if (parts.length != 3) return input;

    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];

    return "$year-$month-$day"; 
  } catch (e) {
    return input;
  }
}
String params = Uri(queryParameters: {
  "gender": gender.text,
  "date_of_birth": formatDate(birthDate.text),
  "national_id": nationalId.text,
  "region": regoin.text,
  "address": address.text,
  "marital_status": maritalStatus.text,
  "family_size": familyMembers.text,
  "education_level": education.text,
  "income_before": incomeBefore.text,
  "income_after": incomeAfter.text,
}).query;

final response = await APIService.instance.request(Request(
  endPoint: "${EndPoints.update_beneficiary(beneficiary.value!.id)}?$params",
  method: RequestMethod.post,
  header: {
    "Authorization": "Bearer $token",
    "Accept": "application/json",
  },
  fromJson: (json) => json,
));

  if (response.success) {
    Get.snackbar("تم", "تم تحديث البيانات بنجاح",
        snackPosition: SnackPosition.BOTTOM,colorText: StyleRepo.glowGreen);

    fetchBeneficiaryDetails(); 
    isEditing.value = false;  
  } else {
    Get.snackbar("خطأ", "فشل تحديث البيانات",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  }
}
}