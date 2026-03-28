import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/services/pagination/widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/controller.dart';
import '../../../../core/style/repo.dart';
import 'widgets/income_card.dart';
import 'widgets/info_field.dart';
import 'widgets/section_title.dart';

class MonitoringProgramPage extends StatelessWidget {
  final int programId;

  MonitoringProgramPage({super.key, required this.programId});

  final controller = Get.find<MonitoringProgramController>();
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
        return "موقوف";
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
        return StyleRepo.purple;
      case "cancelled":
        return StyleRepo.red;
      case "suspended":
        return StyleRepo.deepGrey;
      case "expired":
        return StyleRepo.deepOrange;
      default:
        return StyleRepo.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleRepo.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: StyleRepo.white,
        iconTheme: const IconThemeData(color: StyleRepo.black),
        centerTitle: true,
        title: Text(
          "متابعة البرنامج",
          style: GoogleFonts.notoSansArabic(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.program.value == null) {
          return const Center(child: PageLoading());
        }

        final p = controller.program.value!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        p.name ?? "",
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(p.status ?? ""),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          getStatusText(p.status ?? ""),
                          style: GoogleFonts.notoSansArabic(
                            color: StyleRepo.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(25),

                const SectionTitle(
                  title: "معلومات البرنامج",
                  icon: Icons.menu_book,
                ),
                const Gap(10),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: StyleRepo.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: StyleRepo.lightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InfoField(
                        label: "الوصف",
                        value: p.description ?? "",
                        isEditing: false,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoField(
                            label: "نوع البرنامج",
                            value: p.type ?? "",
                            isEditing: false,
                          ),
                          InfoField(
                            label: "الفئة العمرية",
                            value:
                                "${p.targetAgeMin ?? 0} - ${p.targetAgeMax ?? 0}",
                            isEditing: false,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoField(
                            label: "الجنس المستهدف",
                            value: p.targetGender ?? "",
                            isEditing: false,
                          ),
                          InfoField(
                            label: "الموقع",
                            value: p.location ?? "",
                            isEditing: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(25),

                const SectionTitle(
                  title: "الميزانية",
                  icon: Icons.payments_outlined,
                ),
                const Gap(12),

                Row(
                  children: [
                    Expanded(
                      child: IncomeCard(
                        title: "الميزانية الكلية",
                        value: (p.totalBudgetUsd ?? 0).toString(),
                        isEditing: false,
                        bg: StyleRepo.lightBlue,
                        border: StyleRepo.blue,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: IncomeCard(
                        title: "المنفق",
                        value: (p.spentBudgetUsd ?? 0).toString(),
                        isEditing: false,
                        bg: StyleRepo.lightGreen,
                        border: StyleRepo.glowGreen,
                      ),
                    ),
                  ],
                ),

                const Gap(30),

                const SectionTitle(title: "الوقت", icon: Icons.date_range),
                const Gap(12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: StyleRepo.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: StyleRepo.lightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoField(
                        label: "تاريخ البدء",
                        value: p.startDate ?? "",
                        isEditing: false,
                      ),
                      InfoField(
                        label: "تاريخ الانتهاء",
                        value: p.endDate ?? "",
                        isEditing: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
