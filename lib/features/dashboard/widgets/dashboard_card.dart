import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
            style: const TextStyle(
              color: StyleRepo.deepGrey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("إجمالي "),
              Text(
                total,
                style: TextStyle(
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
                  const Text("نشط "),
                  Text(
                    active,
                    style: const TextStyle(color: StyleRepo.green),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("$unActive "),
                  Text(
                    inactive,
                    style: const TextStyle(color: StyleRepo.red),
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