import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:green_org/features/users/all_users/widgets/custom_box.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String status;
  final String phoneNumber;
  final String role;
  final VoidCallback? onTap;

  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.status,
    required this.phoneNumber,
    required this.role,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    Row(
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.notoSansArabic(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
                  ],
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
                        "الايميل",
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 15,
                          color: StyleRepo.glowGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        email,
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: StyleRepo.deepGrey,
                        ),
                      ),
                      const Gap(6),
                                            Text(
                        "الرقم",
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 15,
                          color: StyleRepo.glowGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        phoneNumber,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            "إضافة مستفيد",
                            style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.bold,
                              color: StyleRepo.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomBox(
                      title: "الدور",
                      value: role,
                      cardColor: StyleRepo.lightGlownAmber,
                      titleColor: StyleRepo.amber,
                      valueColor: StyleRepo.amber,
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
