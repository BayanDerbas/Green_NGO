import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBox extends StatelessWidget {
  final String title;
  final String value;
  final Color cardColor;
  final Color titleColor;
  final Color valueColor;

  const CustomBox({
    super.key,
    required this.title,
    required this.value,
    required this.cardColor,
    required this.titleColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.notoSansArabic(
              fontSize: 14,
              color: titleColor,
              fontWeight: FontWeight.bold
            ),
          ),
          const Gap(4),
          Text(
            "${value}",
            style: GoogleFonts.notoSansArabic(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}