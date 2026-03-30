import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/routes/routes.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:green_org/core/widgets/custom_card.dart';
import 'package:green_org/core/widgets/custom_drawer.dart';
import 'package:green_org/core/widgets/custom_header.dart';
import 'package:green_org/features/dashboard/widgets/dashboard_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../beneficiaries/monitoring_beneficiaries/all_beneficiaries/controller/controller.dart';
import '../programs/all_programs/controller/controller.dart';
import '../projects/all_projects/controller/controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Future<void> openPowerBi() async {
  final url = Uri.parse(
    "https://app.powerbi.com/reportEmbed?reportId=7935771d-0fb6-4bc9-b88d-68a744a5473a&autoAuth=true&ctid=1c2606a3-a680-45e3-b56f-c24684b15415",
  );

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception("Could not launch Power BI link");
  }
}

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
        final projectsController = Get.put(
      AllProjectsController(),
      tag: AllProjectsController.tag,
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
                children: [
                  const DashboardCard(
                    title: "المستفيدين",
                    total: "+894",
                    numColor: StyleRepo.blue,
                    icon: Icons.people,
                    iconColor: StyleRepo.blue,
                    bgColor: StyleRepo.lightBlue,
                  ),

                  const DashboardCard(
                    title: "البرامج",
                    total: "+43",
                    numColor: StyleRepo.glownAmber,
                    icon: Icons.menu_book,
                    iconColor: StyleRepo.glownAmber,
                    bgColor: StyleRepo.lightGlownAmber,
                  ),

                  const DashboardCard(
                    title: "المشاريع",
                    total: "+300",
                    numColor: StyleRepo.purple,
                    icon: Icons.track_changes,
                    iconColor: StyleRepo.purple,
                    bgColor: StyleRepo.lightPurple,
                  ),

                  const DashboardCard(
                    title: "المتابعات",
                    total: "+500",
                    numColor: StyleRepo.magentaPink,
                    icon: Icons.assignment,
                    iconColor: StyleRepo.magentaPink,
                    bgColor: StyleRepo.lightPink,
                  ),

                  const DashboardCard(
                    title: "الأنشطة المنفذة",
                    total: "+135",
                    numColor: StyleRepo.deepOrange,
                    icon: Icons.show_chart,
                    iconColor: StyleRepo.deepOrange,
                    bgColor: StyleRepo.softOrange,
                  ),

                  DashboardCard(
                    onTap: () => openPowerBi(),
                    title: "مؤشرات الأداء",
                    total: "انقر للتفاصيل",
                    size: 18,
                    numColor: StyleRepo.teal,
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
                    return const Center(child: CircularProgressIndicator(color: StyleRepo.glowGreen,));
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
                    return const Center(child: CircularProgressIndicator(color: StyleRepo.glowGreen,));
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
                        subtitle: "الموقع : ${p.location ?? ''}",
                        onTap: () {
                          if (p.id != null) {
                            Get.toNamed(
                              Pages.monitoringProgram.route,
                              arguments: p.id,
                            );
                          } else {
                            Get.snackbar(
                              "خطأ",
                              "لا يمكن فتح البرنامج (ID غير موجود)",
                            );
                          }
                        },
                      );
                    }).toList(),
                  );
                },
              ),
               const Gap(20),

              FutureBuilder(
                future: projectsController.getLastThreeProjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: StyleRepo.glowGreen,));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("لا يوجد مشاريع");
                  }

                  final programs = snapshot.data!;

                  return CustomCard(
                    title: "آخر المشاريع",
                    items: programs.map((p) {
                      return CustomCardItem(
                        leading: getStatusText(p.status ?? ""),
                        leadingColor: getStatusColor(p.status ?? ""),
                        title: p.name ?? "",
                        subtitle: "الموقع : ${p.location ?? ''}",
                        onTap: () {
                          if (p.id != null) {
                            Get.toNamed(
                              Pages.monitoringProject.route,
                              arguments: p.id,
                            );
                          } else {
                            Get.snackbar(
                              "خطأ",
                              "لا يمكن فتح المشروع (ID غير موجود)",
                            );
                          }
                        },
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
