import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/style/repo.dart';

class BadgeItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const BadgeItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: StyleRepo.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: StyleRepo.deepGrey),
          const Gap(4),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}