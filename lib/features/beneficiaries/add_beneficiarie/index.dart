import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:green_org/core/widgets/custom_drawer.dart';
import 'package:green_org/core/widgets/custom_dropdown.dart';
import 'package:green_org/core/widgets/custom_elevatedbutton.dart';
import 'package:green_org/core/widgets/custom_header.dart';
import 'package:green_org/core/widgets/custom_textfield.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/controller/controller.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/widgets/field_label.dart';
import 'package:green_org/features/beneficiaries/add_beneficiarie/widgets/section_title.dart';

class AddBeneficiarie extends StatelessWidget {
  AddBeneficiarie({super.key});

  final controller = Get.put(AddBeneficiarieController());

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
              const CustomHeader(title: "إضافة مستفيد"),
              const Gap(20),
              const Text(
                "إضافة مستفيد جديد",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Gap(5),
              const Text(
                "المعلومات الأساسية",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("الاسم الكامل"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.nameController,
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("الجنس"),
                              const Gap(6),
                              CustomDropdown<String>(
                                value: controller.gender,
                                items: controller.genders,
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
                              const FieldLabel("تاريخ الميلاد"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.birthDateController,
                                readOnly: true,
                                onTap: () => controller.pickDate(context),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("العمر"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.ageController,
                                hint: "23 مثال",
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                        // const Gap(20),
                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.end,
                        //     children: [
                        //       const FieldLabel("رقم الهاتف"),
                        //       const Gap(6),
                        //       CustomTextField(
                        //         controller: controller.phoneController,
                        //         hint: "0999999999 مثال",
                        //         keyboardType: TextInputType.phone,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    const Gap(20),

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     const FieldLabel("البريد الإلكتروني"),
                    //     const Gap(6),
                    //     CustomTextField(
                    //       controller: controller.emailController,
                    //       hint: "example@email.com",
                    //       keyboardType: TextInputType.emailAddress,
                    //     ),
                    //   ],
                    // ),
                    // const Gap(30),
                    const SectionTitle("الموقع"),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("العنوان التفصيلي"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.addressController,
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("المنطقة"),
                              const Gap(6),
                              CustomDropdown<String>(
                                value: controller.region,
                                items: controller.regions,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),

                    const SectionTitle("الحالة"),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("عدد أفراد الأسرة"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.familyCountController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("الحالة الاجتماعية"),
                              const Gap(6),
                              CustomDropdown<String>(
                                value: controller.socialStatus,
                                items: controller.socialStatuses,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("الدخل قبل البرنامج"),
                              const Gap(6),
                              CustomTextField(
                                controller: controller.incomeController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FieldLabel("المستوى التعليمي"),
                              const Gap(6),
                              CustomDropdown<String>(
                                value: controller.education,
                                items: controller.educationLevels,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const FieldLabel("الدخل بعد البرنامج"),
                        const Gap(6),
                        CustomTextField(
                          controller: controller.incomeAfterController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    const Gap(30),
                    const SectionTitle("الرقم الوطني"),
                    const Gap(10),
                    CustomTextField(controller: controller.nationalController),
                    const Gap(35),
                    CustomElevatedButton(
                      text: "حفظ المستفيد",
                      onPressed: controller.saveBeneficiary,
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
