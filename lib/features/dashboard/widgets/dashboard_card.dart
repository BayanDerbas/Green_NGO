import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';
class DashboardCard extends StatelessWidget {
  final String title;
  final String total;
  final String active;
  final String inactive;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String? unActive;
  final Color numColor;

  const DashboardCard({
    super.key,
    required this.title,
    required this.total,
    required this.active,
    required this.inactive,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.unActive = "غير نشط",
    required this.numColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: StyleRepo.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),

          const Gap(3),

          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSansArabic(
              color: StyleRepo.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "إجمالي ",
                style: GoogleFonts.notoSansArabic(
                  color: StyleRepo.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                total,
                style: GoogleFonts.notoSansArabic(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: numColor,
                ),
              ),
            ],
          ),

          const Divider(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "نشط ",
                    style: GoogleFonts.notoSansArabic(
                      color: StyleRepo.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    active,
                    style: GoogleFonts.notoSansArabic(
                      color: StyleRepo.green,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "$unActive ",
                    style: GoogleFonts.notoSansArabic(
                      color: StyleRepo.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    inactive,
                    style: GoogleFonts.notoSansArabic(
                      color: StyleRepo.red,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}