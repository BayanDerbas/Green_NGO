import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/style/repo.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool active;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? StyleRepo.glowGreen : StyleRepo.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.notoSansArabic(
                fontWeight: FontWeight.bold,
                color: active ? StyleRepo.white : StyleRepo.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}