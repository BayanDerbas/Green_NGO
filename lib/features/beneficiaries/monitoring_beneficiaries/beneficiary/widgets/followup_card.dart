import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    final statusIcon = isSuccess ? Icons.check_circle_outline : Icons.cancel_outlined;

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
                          const Text(
                            "ملاحظات",
                            style: TextStyle(
                              color: StyleRepo.deepGrey,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(4),
                          TextField(
                            controller: notes,
                            maxLines: 3,
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
                                  Text(statusText, style: TextStyle(color: statusColor)),
                                ],
                              ),
                            ],
                          ),
                          const Gap(8),
                          Text(date),
                          const Gap(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "الدخل عند المتابعة",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(income),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("الحالة الوظيفية"),
                                  Text(jobStatus),
                                ],
                              ),
                            ],
                          ),
                          const Gap(8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ملاحظات",
                                style: TextStyle(color: StyleRepo.deepGrey, fontSize: 14),
                              ),
                              const Gap(4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(notesText),
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