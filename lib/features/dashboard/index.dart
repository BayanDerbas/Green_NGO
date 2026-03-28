import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/routes/routes.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:green_org/core/widgets/custom_card.dart';
import 'package:green_org/core/widgets/custom_drawer.dart';
import 'package:green_org/core/widgets/custom_header.dart';
import 'package:green_org/features/dashboard/widgets/dashboard_card.dart';
import '../beneficiaries/monitoring_beneficiaries/all_beneficiaries/controller/controller.dart';
import '../programs/all_programs/controller/controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  String getStatusText(String status) {
    switch (status.toLowerCase()) {
      case "draft":
        return "مسودة";
      case "active":
        return "نشط";
      case "approved":
        return "مقبول";
      case "cancelled":
        return "ملغي";
      case "suspended":
        return "معلق";
      case "expired":
        return "منتهي";
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "draft":
        return StyleRepo.amber;
      case "active":
        return StyleRepo.green;
      case "approved":
        return StyleRepo.blue;
      case "cancelled":
        return StyleRepo.red;
      case "suspended":
        return StyleRepo.purple;
      case "expired":
        return StyleRepo.deepGrey;
      default:
        return StyleRepo.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final beneficiariesController = Get.put(AllBeneficiariesController());
    final programsController = Get.put(
      AllProgramsController(),
      tag: AllProgramsController.tag,
    );
    return Scaffold(
      backgroundColor: StyleRepo.white,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Column(
            children: [
              const CustomHeader(title: "لوحة تحكم المشرف"),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                children: const [
                  DashboardCard(
                    title: "المستفيدين",
                    total: "124",
                    numColor: StyleRepo.blue,
                    active: "98",
                    inactive: "26",
                    icon: Icons.people,
                    iconColor: StyleRepo.blue,
                    bgColor: StyleRepo.lightBlue,
                  ),

                  DashboardCard(
                    title: "البرامج",
                    total: "6",
                    numColor: StyleRepo.glownAmber,
                    active: "4",
                    inactive: "2",
                    icon: Icons.menu_book,
                    iconColor: StyleRepo.glownAmber,
                    bgColor: StyleRepo.lightGlownAmber,
                  ),

                  DashboardCard(
                    title: "المشاريع",
                    total: "3",
                    numColor: StyleRepo.purple,
                    active: "2",
                    inactive: "1",
                    icon: Icons.track_changes,
                    iconColor: StyleRepo.purple,
                    bgColor: StyleRepo.lightPurple,
                  ),

                  DashboardCard(
                    title: "المتابعات",
                    total: "80",
                    numColor: StyleRepo.magentaPink,
                    active: "60",
                    inactive: "20",
                    icon: Icons.assignment,
                    iconColor: StyleRepo.magentaPink,
                    bgColor: StyleRepo.lightPink,
                  ),

                  DashboardCard(
                    title: "الأنشطة المنفذة",
                    total: "35",
                    numColor: StyleRepo.deepOrange,
                    active: "20",
                    inactive: "15",
                    icon: Icons.show_chart,
                    iconColor: StyleRepo.deepOrange,
                    bgColor: StyleRepo.softOrange,
                  ),

                  DashboardCard(
                    title: "مؤشرات الأداء",
                    total: "7",
                    numColor: StyleRepo.teal,
                    active: "5",
                    inactive: "2",
                    unActive: "غير محقق",
                    icon: Icons.trending_up,
                    iconColor: StyleRepo.teal,
                    bgColor: StyleRepo.lightCyan,
                  ),
                ],
              ),

              const Gap(25),

              FutureBuilder(
                future: beneficiariesController.getLastThreeBeneficiaries(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("لا يوجد مستفيدين");
                  }

                  final items = snapshot.data!;

                  return CustomCard(
                    title: "أحدث المستفيدين",
                    items: items.map((b) {
                      return CustomCardItem(
                        leading: b.createdAt,
                        title: b.user!.fullName,
                        subtitle: b.maritalStatus,
                        onTap: () => Get.toNamed(
                          Pages.monitoringBeneficiary.route,
                          arguments: b.id,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              const Gap(20),

              FutureBuilder(
                future: programsController.getLastThreePrograms(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("لا يوجد برامج");
                  }

                  final programs = snapshot.data!;

                  return CustomCard(
                    title: "آخر البرامج",
                    items: programs.map((p) {
                      return CustomCardItem(
                        leading: getStatusText(p.status ?? ""),
                        leadingColor: getStatusColor(p.status ?? ""),
                        title: p.name ?? "",
                        subtitle: p.location ?? "", 
                        onTap: () =>
                            Get.toNamed(Pages.monitoringBeneficiary.route),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
