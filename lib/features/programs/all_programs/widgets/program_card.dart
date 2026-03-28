import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';

import 'money_box.dart';

class ProgramCard extends StatelessWidget {
  final String name;
  final String type;
  final double totalBudgetUsd;
  final double spentBudgetUsd;
  final String status;
  final VoidCallback? onTap;

  const ProgramCard({
    super.key,
    required this.name,
    required this.type,
    required this.totalBudgetUsd,
    required this.spentBudgetUsd,
    required this.status,
    this.onTap,
  });

  String get statusText {
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

  Color get statusColor {
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

  Color get statusLightColor {
    switch (status.toLowerCase()) {
      case "draft":
        return StyleRepo.lightGlownAmber;
      case "active":
        return StyleRepo.lightGreen;
      case "approved":
        return StyleRepo.lightPurple;
      case "cancelled":
        return StyleRepo.lightPink;
      case "suspended":
        return StyleRepo.lightGrey;
      case "expired":
        return StyleRepo.softOrange;
      default:
        return StyleRepo.lightGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: StyleRepo.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: StyleRepo.black.withOpacity(.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusLightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  statusText,
                  style: GoogleFonts.notoSansArabic(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

              Expanded(
                child: Text(
                  name,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.notoSansArabic(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Gap(8),
          Text(
            "$type :نوع البرنامج",
            style: GoogleFonts.notoSansArabic(color: StyleRepo.deepGrey),
          ),
          const Gap(20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MoneyBox(
                title: "الميزانية الكلية",
                value: totalBudgetUsd,
                cardColor: StyleRepo.lightBlue,
                titleColor: StyleRepo.blue,
                valueColor: StyleRepo.blue,
              ),
              const Gap(10),
              MoneyBox(
                title: "المنفق",
                value: spentBudgetUsd,
                cardColor: StyleRepo.softRose,
                titleColor: StyleRepo.rose,
                valueColor: StyleRepo.rose,
              ),
            ],
          ),
          const Gap(16),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: StyleRepo.glowGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              "التفاصيل",
              style: GoogleFonts.notoSansArabic(
                color: StyleRepo.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
