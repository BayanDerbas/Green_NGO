import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MoneyBox extends StatelessWidget {
  final String title;
  final double value;
  final Color cardColor;
  final Color titleColor;
  final Color valueColor;

  const MoneyBox({
    super.key,
    required this.title,
    required this.value,
    required this.cardColor,
    required this.titleColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: titleColor,
            ),
          ),
          const Gap(4),
          Text(
            "\$${value.toStringAsFixed(0)}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}