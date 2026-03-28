import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/services/pagination/widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/controller.dart';
import 'widgets/beneficiary_tabs.dart';
import 'widgets/income_card.dart';
import 'widgets/info_field.dart';
import 'widgets/section_title.dart';
import 'widgets/followup_card.dart';
import '../../../../core/style/repo.dart';

class MonitoringBeneficiariePage extends StatelessWidget {
  final int beneficiaryId;

  MonitoringBeneficiariePage({super.key, required this.beneficiaryId});

  final controller = Get.put(
    MonitoringBeneficiariesController(Get.arguments ?? 0),
  );

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
          "متابعة المستفيد",
          style: GoogleFonts.notoSansArabic(
            color: StyleRepo.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.beneficiary.value == null) {
          return const Center(child: PageLoading());
        }

        final b = controller.beneficiary.value!;

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
                        b.user.fullName,
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
                          color: StyleRepo.glowGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          b.user.status == "active" ? "نشط" : "غير نشط",
                          style: GoogleFonts.notoSansArabic(
                            color: StyleRepo.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(25),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BeneficiaryTabItem(
                        title: "عرض معلومات المستفيد",
                        isActive: !controller.isEditing.value,
                        onTap: controller.showView,
                      ),
                      BeneficiaryTabItem(
                        title: "تعديل المعلومات",
                        isActive: controller.isEditing.value,
                        onTap: controller.showEdit,
                      ),
                    ],
                  ),
                ),
                const Gap(20),

                const SectionTitle(
                  title: "التفاصيل الشخصية",
                  icon: Icons.person_outline,
                ),
                const Gap(10),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: StyleRepo.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InfoField(
                                label: "الجنس",
                                value: b.gender,
                                isEditing: controller.isEditing.value,
                                onChanged: (v) => controller.gender.text = v,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: InfoField(
                                label: "تاريخ الميلاد",
                                value: b.dateOfBirth,
                                isEditing: controller.isEditing.value,
                                onChanged: (v) => controller.birthDate.text = v,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InfoField(
                                label: "الحالة الاجتماعية",
                                value: b.maritalStatus,
                                isEditing: controller.isEditing.value,
                                onChanged: (v) =>
                                    controller.maritalStatus.text = v,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: InfoField(
                                label: "العمر",
                                value: b.age.toString(),
                                isEditing: controller.isEditing.value,
                                onChanged: (v) => controller.age.text = v,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InfoField(
                                label: "عدد أفراد الأسرة",
                                value: b.familySize.toString(),
                                isEditing: controller.isEditing.value,
                                onChanged: (v) =>
                                    controller.familyMembers.text = v,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: InfoField(
                                label: "التعليم",
                                value: b.educationLevel,
                                isEditing: controller.isEditing.value,
                                onChanged: (v) => controller.education.text = v,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InfoField(
                                label: "الرقم الوطني",
                                value: b.nationalId,
                                isEditing: controller.isEditing.value,
                                onChanged: (v) =>
                                    controller.nationalId.text = v,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: InfoField(
                                label: "رقم الهاتف",
                                value: b.user.phone,
                                isEditing: controller.isEditing.value,
                                onChanged: (v) => controller.phone.text = v,
                              ),
                            ),
                          ],
                        ),
                        InfoField(
                          label: "البريد الإلكتروني",
                          value: b.user.email,
                          isEditing: false,
                        ),
                                                Obx(() {
                          if (!controller.isEditing.value) {
                            return Column(
                              children: [
                                Text(
                                  "العنوان",
                                  style: GoogleFonts.notoSansArabic(
                                    color: StyleRepo.deepGrey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "${b.region} - ${b.address}",
                                  style: GoogleFonts.notoSansArabic(
                                    color: StyleRepo.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            );
                          }

                          return Column(
                            children: [
                              InfoField(
                                label: "المنطقة",
                                value: b.region,
                                isEditing: true,
                                onChanged: (v) => controller.regoin.text = v,
                              ),
                              InfoField(
                                label: "العنوان",
                                value: b.address,
                                isEditing: true,
                                onChanged: (v) => controller.address.text = v,
                              ),
                              const Gap(10),
                            ],
                          );
                        }),
                        const Gap(10),
                      ],
                    ),
                  ),
                ),

                const Gap(25),

                const SectionTitle(
                  title: "الوضع الاقتصادي",
                  icon: Icons.payments_outlined,
                ),
                const Gap(12),

                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: IncomeCard(
                          title: "الدخل قبل",
                          value: b.incomeBefore.toString(),
                          isEditing: controller.isEditing.value,
                          onChanged: (v) => controller.incomeBefore.text = v,
                          bg: StyleRepo.lightBlue,
                          border: StyleRepo.blue,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: IncomeCard(
                          title: "الدخل حالياً",
                          value: b.incomeAfter.toString(),
                          isEditing: controller.isEditing.value,
                          onChanged: (v) => controller.incomeAfter.text = v,
                          bg: StyleRepo.lightGreen,
                          border: StyleRepo.glowGreen,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(30),

                const SectionTitle(
                  title: "آخر مدخلات سجل المتابعة",
                  icon: Icons.fact_check,
                ),
                const Gap(12),

                Obx(
                  () => FollowupCard(
                    isEditing: controller.isEditing.value,
                    notes: controller.notes,
                    date: b.updatedAt,
                    income: b.incomeAfter.toString(),
                    jobStatus: b.employmentStatus,
                    notesText: b.user.role,
                    isSuccess:
                        b.employmentStatus.trim().toLowerCase() == "employed",
                  ),
                ),

                const Gap(10),
                Obx(() {
                  if (!controller.isEditing.value) return SizedBox();
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleRepo.glowGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () => controller.updateBeneficiaryDetails(),
                    child: Text(
                      "حفظ التعديلات",
                      style: GoogleFonts.notoSansArabic(
                        color: StyleRepo.white,
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
