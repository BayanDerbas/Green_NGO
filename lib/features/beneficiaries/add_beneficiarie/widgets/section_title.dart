import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.notoSansArabic(
        color: StyleRepo.glowGreen,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
