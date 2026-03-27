import 'package:get/get.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/index.dart';
import 'package:green_org/features/dashboard/index.dart';
import 'package:green_org/features/login/binding/binding.dart';
import 'package:green_org/features/login/index.dart';
import 'package:green_org/features/users/all_users/index.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/all_beneficiaries/binding/binding.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/all_beneficiaries/index.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/beneficiary/controller/controller.dart';
import '../../features/beneficiaries/monitoring_beneficiaries/beneficiary/index.dart';
import '../../features/users/all_users/binding/binding.dart';
import '../config/app_builder.dart';

abstract class AppRouting {
  static String get initial {
    final app = Get.find<AppBuilder>();

    return app.isLoggedIn ? Pages.dashboard.route : Pages.login.route;
  }

  static final List<GetPage> pages = [
    Pages.login.page,
    Pages.dashboard.page,
    Pages.monitoringBeneficiary.page,
    Pages.addBeneficiaries.page,
    Pages.allBeneficiaries.page,
    Pages.allUsers.page,
  ];
}

enum Pages {
  login,
  dashboard,
  monitoringBeneficiary,
  addBeneficiaries,
  allBeneficiaries,
  allUsers;

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
        return GetPage(name: route, page: () => const DashboardPage());
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
      case Pages.allUsers:
      return GetPage(name: route, page:() => AllUsersPage(),binding: AllUsersBinding());  
    }
  }
}
