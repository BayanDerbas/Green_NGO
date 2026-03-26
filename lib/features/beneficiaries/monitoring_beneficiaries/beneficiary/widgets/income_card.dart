import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isEditing;
  final ValueChanged<String>? onChanged;
  final Color bg;
  final Color border;

  const IncomeCard({
    super.key,
    required this.title,
    required this.value,
    required this.isEditing,
    this.onChanged,
    required this.bg,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border(right: BorderSide(color: border, width: 3)),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: StyleRepo.deepGrey)),
          const SizedBox(height: 6),
          isEditing
              ? TextField(
                  controller: TextEditingController(text: value),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: onChanged,
                )
              : Text(
                  "$value ل.س",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}