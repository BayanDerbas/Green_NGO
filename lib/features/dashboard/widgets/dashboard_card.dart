import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String total;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String? unActive;
  final Color numColor;
  final VoidCallback? onTap;
  final double? size;

  const DashboardCard({
    super.key,
    required this.title,
    required this.total,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.unActive = "غير نشط",
    required this.numColor,
    this.onTap,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: StyleRepo.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
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

            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansArabic(
                color: StyleRepo.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            if (total.startsWith("+")) ...[
              TweenAnimationBuilder(
                tween: IntTween(
                  begin: 0,
                  end: int.tryParse(total.replaceAll("+", "")) ?? 0,
                ),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return Text(
                    "+$value",
                    style: GoogleFonts.notoSansArabic(
                      fontSize: size,
                      fontWeight: FontWeight.bold,
                      color: numColor,
                    ),
                  );
                },
              ),
            ] else ...[
              Text(
                total,
                style: GoogleFonts.notoSansArabic(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  color: numColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
