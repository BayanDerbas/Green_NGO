import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:green_org/core/widgets/custom_drawer.dart';
import 'package:green_org/core/widgets/custom_dropdown.dart';
import 'package:green_org/core/widgets/custom_elevatedbutton.dart';
import 'package:green_org/core/widgets/custom_header.dart';
import 'package:green_org/core/widgets/custom_textfield.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/widgets/field_label.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/widgets/section_title.dart';
import 'controller/controller.dart';

class AddProgramPage extends StatelessWidget {
  AddProgramPage({super.key});

  final controller = Get.put(AddProgramController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleRepo.white,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Gap(10),
              const CustomHeader(title: "إضافة برنامج"),
              const Gap(20),

              Text(
                "إضافة برنامج جديد",
                style: GoogleFonts.notoSansArabic(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(5),
              Text(
                "المعلومات الأساسية",
                style: GoogleFonts.notoSansArabic(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: StyleRepo.glowGreen,
                ),
              ),
              const Gap(25),

              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: StyleRepo.grey.withOpacity(.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const FieldLabel("اسم البرنامج"),
                    const Gap(6),
                    CustomTextField(
                      controller: controller.nameController,
                      hint: "مثال: برنامج دعم الأسر",
                    ),
                    const Gap(20),
                    const FieldLabel("الوصف"),
                    const Gap(6),
                    CustomTextField(
                      controller: controller.descriptionController,
                      maxLines: 3,
                      hint: "وصف موجز عن البرنامج",
                    ),
                    const Gap(20),
                    Text(
                      "نوع البرنامج",
                      style: GoogleFonts.notoSansArabic(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(6),
                    CustomDropdown<String>(
                      value: controller.programType,
                      items: controller.programTypes,
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("العمر الأدنى"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.minAgeController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("العمر الأعلى"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.maxAgeController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    const FieldLabel("الجنس المستهدف"),
                    const Gap(6),
                    CustomTextField(
                      controller: controller.genderController,
                      hint: "male,female,all..",
                    ),
                    const Gap(20),
                    const FieldLabel("الموقع"),
                    const Gap(6),
                    CustomTextField(
                      controller: controller.locationController,
                      hint: "مثال: صنعاء / عدن /  ...",
                    ),
                    const Gap(30),

                    const SectionTitle("الميزانية"),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("الميزانية الكلية بالدولار"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.budgetController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("الميزانية المصروفة بالدولار"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.spentBudgetController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    const FieldLabel("حالة البرنامج"),
                    const Gap(6),
                    CustomTextField(
                      controller: controller.statusController,
                      hint: "active,approved,draft,cancelled",
                    ),
                    const Gap(20),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("تاريخ البداية"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.startDateController,
                                hint: "YYYY-MM-DD",
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("تاريخ النهاية"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.endDateController,
                                hint: "YYYY-MM-DD",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("رقم المشروع"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.projectIdController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("مدير البرنامج"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.managerIdController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const Gap(35),
                    SizedBox(
                      width: 180,
                      height: 55,
                      child: CustomElevatedButton(
                        text: "حفظ البرنامج",
                        onPressed: controller.createProgram,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
