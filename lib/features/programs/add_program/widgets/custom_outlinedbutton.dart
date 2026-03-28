import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: StyleRepo.glowGreen),
      ),
      child: Text(
        text,
        style: GoogleFonts.notoSansArabic(
          fontSize: 16,
          color: StyleRepo.glowGreen,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}