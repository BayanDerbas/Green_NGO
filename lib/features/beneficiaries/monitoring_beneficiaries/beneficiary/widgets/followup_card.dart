import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/style/repo.dart';

class FollowupCard extends StatelessWidget {
  final bool isEditing;
  final TextEditingController notes;
  final String date;

  final String income;
  final String jobStatus;

  final String notesText;

  final bool isSuccess;

  const FollowupCard({
    super.key,
    required this.isEditing,
    required this.notes,
    required this.date,
    required this.income,
    required this.jobStatus,
    required this.notesText,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = isSuccess ? StyleRepo.glowGreen : Colors.red;
    final statusText = isSuccess ? "تحسن مستدام" : "لم يتحسن";
    final statusIcon =
        isSuccess ? Icons.check_circle_outline : Icons.cancel_outlined;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: StyleRepo.lightGrey),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: isEditing
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ملاحظات",
                            style: GoogleFonts.notoSansArabic(
                              color: StyleRepo.deepGrey,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(4),
                          TextField(
                            controller: notes,
                            maxLines: 3,
                            style: GoogleFonts.notoSansArabic(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(statusIcon, color: statusColor),
                                  const Gap(4),
                                  Text(
                                    statusText,
                                    style: GoogleFonts.notoSansArabic(
                                      color: statusColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const Gap(8),

                          Text(
                            date,
                            style: GoogleFonts.notoSansArabic(),
                          ),

                          const Gap(8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الدخل عند المتابعة",
                                    style: GoogleFonts.notoSansArabic(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    income,
                                    style: GoogleFonts.notoSansArabic(),
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الحالة الوظيفية",
                                    style: GoogleFonts.notoSansArabic(),
                                  ),
                                  Text(
                                    jobStatus,
                                    style: GoogleFonts.notoSansArabic(),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const Gap(8),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ملاحظات",
                                style: GoogleFonts.notoSansArabic(
                                  color: StyleRepo.deepGrey,
                                  fontSize: 14,
                                ),
                              ),
                              const Gap(4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  notesText,
                                  style: GoogleFonts.notoSansArabic(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}