import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:green_org/features/beneficiaries/monitoring_beneficiaries/all_beneficiaries/widgets/badge_item.dart';
import 'package:green_org/features/beneficiaries/monitoring_beneficiaries/all_beneficiaries/widgets/money_box.dart';

class BeneficiaryCard extends StatelessWidget {
  final String name;
  final String status;
  final String job_status;
  final String city;
  final String gender;
  final String education;
  final int numOfFamily;
  final String phoneNumber;
  final String improvement;
  final double before;
  final double after;
  final VoidCallback? onTap;

  const BeneficiaryCard({
    super.key,
    required this.name,
    required this.status,
    required this.job_status,
    required this.city,
    required this.gender,
    required this.education,
    required this.numOfFamily,
    required this.phoneNumber,
    required this.improvement,
    required this.before,
    required this.after,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: StyleRepo.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: status == "نشط"
                            ? StyleRepo.lightGreen
                            : StyleRepo.lightPink,  
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: GoogleFonts.notoSansArabic(
                          color: status == "نشط"
                              ? StyleRepo.glowGreen
                              : StyleRepo.red, 
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Gap(12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.notoSansArabic(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(3),
                          Text(
                            gender,
                            style: GoogleFonts.notoSansArabic(
                              color: StyleRepo.deepGrey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Gap(10),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: StyleRepo.glowGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          name[0],
                          style: GoogleFonts.notoSansArabic(
                            color: StyleRepo.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(12),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BadgeItem(icon: Icons.location_on, text: city),
                      const Gap(6),
                      BadgeItem(icon: Icons.menu_book, text: education),
                      const Gap(6),
                      BadgeItem(icon: Icons.people, text: "$numOfFamily أفراد"),
                      const Gap(6),
                      BadgeItem(icon: Icons.phone, text: phoneNumber),
                    ],
                  ),
                ),

                const Gap(14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: StyleRepo.lightGreen,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الحالة الوظيفية",
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 15,
                          color: StyleRepo.glowGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        job_status,
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: StyleRepo.deepGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: onTap,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          StyleRepo.glowGreen,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new,
                            size: 14,
                            color: StyleRepo.white,
                          ),
                          const Gap(6),
                          Text(
                            "متابعة",
                            style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.bold,
                              color: StyleRepo.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Gap(10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: StyleRepo.lightGlownAmber,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        improvement,
                        style: GoogleFonts.notoSansArabic(
                          color: StyleRepo.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Spacer(),

                    MoneyBox(
                      title: "بعد",
                      value: after,
                      cardColor: StyleRepo.softRose,
                      titleColor: StyleRepo.rose,
                      valueColor: StyleRepo.rose,
                    ),

                    const Gap(8),

                    MoneyBox(
                      title: "قبل",
                      value: before,
                      cardColor: StyleRepo.lightBlue,
                      titleColor: StyleRepo.blue,
                      valueColor: StyleRepo.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
