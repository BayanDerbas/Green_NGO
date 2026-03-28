import 'package:get/get.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/index.dart';
import 'package:green_org/features/dashboard/binding/binding.dart';
import 'package:green_org/features/login/binding/binding.dart';
import 'package:green_org/features/login/index.dart';
import 'package:green_org/features/programs/all_programs/binding/binding.dart';
import 'package:green_org/features/programs/all_programs/index.dart';
import 'package:green_org/features/programs/program/index.dart';
import 'package:green_org/features/projects/project/index.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/all_beneficiaries/binding/binding.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/all_beneficiaries/index.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/beneficiary/controller/controller.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/beneficiary/index.dart';
import '../../features/dashboard/index.dart';
import '../../features/programs/add_program/binding/binding.dart';
import '../../features/programs/add_program/index.dart';
import '../../features/programs/program/controller/controller.dart';
import '../../features/projects/all_projects/binding/binding.dart';
import '../../features/projects/all_projects/index.dart';
import '../../features/projects/project/controller/controller.dart';
import '../../features/users/all_users/binding/binding.dart';
import '../../features/users/all_users/index.dart';
import '../config/app_builder.dart';

abstract class AppRouting {
  static String get initial {
    final app = Get.find<AppBuilder>();

    return app.isLoggedIn ? Pages.dashboard.route : Pages.login.route;
  }

  static final List<GetPage> pages = [
    Pages.login.page,
    Pages.dashboard.page,
    Pages.allPrograms.page,
    Pages.monitoringProgram.page,
    Pages.monitoringBeneficiary.page,
    Pages.addBeneficiaries.page,
    Pages.allBeneficiaries.page,
    Pages.allUsers.page,
    Pages.addProgram.page,
    Pages.allProjects.page,
    Pages.monitoringProject.page,
  ];
}

enum Pages {
  login,
  dashboard,
  allPrograms,
  monitoringProgram,
  monitoringBeneficiary,
  addBeneficiaries,
  allBeneficiaries,
  allUsers,
  allProjects,
  monitoringProject,
  addProgram;

  String get route => "/$name";

  GetPage get page {
    switch (this) {
      case Pages.login:
        return GetPage(
          name: route,
          page: () => LoginPage(),
          binding: LoginBinding(),
        );
      case Pages.dashboard:
        return GetPage(
          name: route,
          page: () => const DashboardPage(),
          binding: DashboardBinding(),
        );
      case Pages.monitoringBeneficiary:
        return GetPage(
          name: route,
          page: () {
            final id = Get.arguments as int;
            return MonitoringBeneficiariePage(beneficiaryId: id);
          },
          binding: BindingsBuilder(() {
            final id = Get.arguments as int;
            Get.lazyPut(() => MonitoringBeneficiariesController(id));
          }),
        );
      case Pages.addBeneficiaries:
        return GetPage(name: route, page: () => AddBeneficiarie());
      case Pages.allBeneficiaries:
        return GetPage(
          name: route,
          page: () => AllBeneficiariesPage(),
          binding: AllBeneficiariesBinding(),
        );
      case Pages.allPrograms:
        return GetPage(
          name: route,
          page: () => AllProgramsPage(),
          binding: AllProgramsBinding(),
        );
      case Pages.monitoringProgram:
        return GetPage(
          name: route,
          page: () {
            final id = Get.arguments ?? 0;
            return MonitoringProgramPage(programId: id);
          },
          binding: BindingsBuilder(() {
            final id = Get.arguments ?? 0;
            Get.lazyPut(() => MonitoringProgramController(id));
          }),
        );
      case Pages.allUsers:
        return GetPage(
          name: route,
          page: () => AllUsersPage(),
          binding: AllUsersBinding(),
        );
      case Pages.addProgram:
        return GetPage(
          name: route,
          page: () => AddProgramPage(),
          binding: AddProgramBinding(),
        );
      case Pages.allProjects:
        return GetPage(
          name: route,
          page: () => AllProjectsPage(),
          binding: AllProjectsBinding(),
        );
      case Pages.monitoringProject:
        return GetPage(
          name: route,
          page: () {
            final projectId = Get.arguments ?? 0;
            return MonitoringProjectPage(projectId: projectId);
          },
          binding: BindingsBuilder(() {
            final id = Get.arguments ?? 0;
            Get.lazyPut(() => MonitoringProjectController(id));
          }),
        );
    }
  }
}
