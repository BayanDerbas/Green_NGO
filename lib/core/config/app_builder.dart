import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_org/features/login/model/login_model.dart';
import 'package:green_org/features/projects/all_projects/model/project_model.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/beneficiary/model/beneficiary_details.dart';
import '../../features/programs/all_programs/model/program_models.dart';
import '../../features/programs/program/model/program_details_model.dart';
import '../../features/projects/project/model/program_details_model.dart';
import '../../features/users/all_users/model/user_model.dart';

const kStorageApp = "app";
const kUserKey = "user";
const kTokenKey = "token";
const kBeneficiariesKey = "beneficiaries";
const kBeneficiaryDetailsKey = "beneficiary_details";
const kUsersKey = "users";
const kProgramsKey = "programs";
const kProjectsKey = "projects";

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

  Future<void> saveUsers(List<UserModel> users) async {
    await _box.write(kUsersKey, users.map((e) => e.toJson()).toList());
  }

  List<UserModel> getCachedUsers() {
    final data = _box.read(kUsersKey) ?? [];
    return List<UserModel>.from(
      data.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e))),
    );
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

  Future<void> saveProgramDetails(ProgramDetailsModel program) async {
    await _box.write("program_${program.id}", program.toJson());
  }

  ProgramDetailsModel? getProgramDetails(int id) {
    final json = _box.read("program_$id");
    if (json != null) {
      return ProgramDetailsModel.fromJson(Map<String, dynamic>.from(json));
    }
    return null;
  }

  Future<void> saveProjects(List<ProjectModel> projects) async {
    await _box.write(kProjectsKey, projects.map((e) => e.toJson()).toList());
  }

  List<ProjectModel> getCachedProjects() {
    final data = _box.read(kProjectsKey) ?? [];

    return List<Map<String, dynamic>>.from(
      data,
    ).map((e) => ProjectModel.fromJson(e)).toList();
  }

  Future<void> saveProjectDetails(ProjectDetailsModel project) async {
    await _box.write("project_${project.id}", project.toJson());
  }

  ProjectDetailsModel? getProjectDetails(int id) {
    final json = _box.read("project_$id");

    if (json != null) {
      return ProjectDetailsModel.fromJson(Map<String, dynamic>.from(json));
    }

    return null;
  }

  Future<void> logout() async {
    await _box.erase();
  }
}
