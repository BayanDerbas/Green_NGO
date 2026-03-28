import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_org/features/users/all_users/model/user_model.dart';
import 'package:green_org/features/users/all_users/widgets/user_card.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/services/pagination/options/list_view.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_header.dart';
import 'controller/controller.dart';

class AllUsersPage extends StatelessWidget {
  AllUsersPage({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllUsersController>(tag: AllUsersController.tag);
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 40),
            child: const CustomHeader(title: "جميع المستخدمين"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListViewPagination<UserModel>.builder(
                tag: AllUsersController.tag,
                fetchApi: controller.getAllUsers,
                fromJson: controller.fromJson,
                itemBuilder: (_, index, b) {
                  return UserCard(
                    onTap: () => Get.toNamed(
                      Pages.addBeneficiaries.route,
                      arguments: b.id,
                    ),
                    name: b.fullName,
                    email: b.email ?? "",
                    role: b.role ?? "",
                    status: (b.status ?? "") == "active"
                        ? "نشط"
                        : "غير نشط",
                    phoneNumber: b.phone ?? "-",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
