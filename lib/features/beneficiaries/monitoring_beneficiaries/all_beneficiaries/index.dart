import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/services/pagination/options/list_view.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_header.dart';
import 'controller/controller.dart';
import 'model/beneficiary_model.dart';
import 'widgets/beneficiary_card.dart';

class AllBeneficiariesPage extends StatelessWidget {
  AllBeneficiariesPage({super.key});

  final controller = Get.find<AllBeneficiariesController>();

  @override
  Widget build(BuildContext context) {
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
              child: ListViewPagination<BeneficiaryModel>.builder(
                tag: AllBeneficiariesController.tag,
                fetchApi: controller.getAllBeneficiaries,
                fromJson: controller.fromJson,
                itemBuilder: (_, index, b) {
                  return BeneficiaryCard(
                    onTap: () => Get.toNamed(
                      Pages.monitoringBeneficiary.route,
                      arguments: b.id,
                    ),
                    name: b.user?.fullName ?? "غير معروف",
                    status: (b.user?.status ?? "") == "active"
                        ? "نشط"
                        : "غير نشط",
                    job_status: b.employmentStatus,
                    city: b.region,
                    gender: b.gender,
                    education: b.educationLevel,
                    numOfFamily: b.familySize,
                    phoneNumber: b.user?.phone ?? "-",
                    improvement:
                        "${((b.incomeAfter - b.incomeBefore) / (b.incomeBefore == 0 ? 1 : b.incomeBefore) * 100).toStringAsFixed(0)}%",
                    before: b.incomeBefore,
                    after: b.incomeAfter,
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
