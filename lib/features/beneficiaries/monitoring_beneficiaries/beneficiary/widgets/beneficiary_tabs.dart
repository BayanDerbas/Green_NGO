import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:green_org/core/style/repo.dart';

class BeneficiaryTabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const BeneficiaryTabItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? StyleRepo.black : StyleRepo.deepGrey,
            ),
          ),

          const Gap(6),

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: 150,
            color: isActive ? StyleRepo.glowGreen : Colors.transparent,
          ),
        ],
      ),
    );
  }
}