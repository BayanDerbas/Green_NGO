import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoField extends StatelessWidget {
  final String label;
  final String value;
  final bool isEditing;
  final ValueChanged<String>? onChanged;

  const InfoField({
    super.key,
    required this.label,
    required this.value,
    required this.isEditing,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.notoSansArabic(
              color: StyleRepo.deepGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          isEditing
              ? TextField(
                  controller: TextEditingController(text: value),
                  onChanged: onChanged,
                  style: GoogleFonts.notoSansArabic(
                    fontSize: 15,
                  ),
                )
              : Text(
                  value,
                  style: GoogleFonts.notoSansArabic(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ],
      ),
    );
  }
}