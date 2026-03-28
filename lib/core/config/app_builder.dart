import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_org/features/login/model/login_model.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/beneficiary/model/beneficiary_details.dart';
import '../../features/programs/all_programs/model/program_models.dart';

const kStorageApp = "app";
const kUserKey = "user";
const kTokenKey = "token";
const kBeneficiariesKey = "beneficiaries";
const kBeneficiaryDetailsKey = "beneficiary_details";
const kProgramsKey = "programs";

class AppBuilder extends GetxService {
  late final GetStorage _box;

  Future<AppBuilder> init() async {
    _box = GetStorage(kStorageApp);
    return this;
  }

  Future<void> saveLogin(LoginModel model) async {
    if (model.user != null) {
      await _box.write(kUserKey, model.user!.toJson());
    }
    if (model.token != null) {
      await _box.write(kTokenKey, model.token);
    }
  }

  String? get token => _box.read(kTokenKey);

  bool get isLoggedIn => token != null;

  Map<String, dynamic>? get user => _box.read(kUserKey);

  Future<void> saveBeneficiaries(List list) async {
    await _box.write(kBeneficiariesKey, list);
  }

  List<dynamic> getCachedBeneficiaries() {
    return _box.read(kBeneficiariesKey) ?? [];
  }

  Future<void> saveBeneficiaryDetails(BeneficiaryDetails b) async {
    await _box.write("$kBeneficiaryDetailsKey${b.id}", b.toJson());
  }

  BeneficiaryDetails? getBeneficiaryDetails(int id) {
    final json = _box.read("$kBeneficiaryDetailsKey$id");
    if (json != null) {
      return BeneficiaryDetails.fromJson(Map<String, dynamic>.from(json));
    }
    return null;
  }

  Future<void> savePrograms(List<ProgramModel> programs) async {
    await _box.write(kProgramsKey, programs.map((e) => e.toJson()).toList());
  }

  List<ProgramModel> getCachedPrograms() {
    final data = _box.read(kProgramsKey) ?? [];
    return List<Map<String, dynamic>>.from(
      data,
    ).map((e) => ProgramModel.fromJson(e)).toList();
  }

  Future<void> logout() async {
    await _box.erase();
  }
}
