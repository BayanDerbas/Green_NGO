import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';

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
          Text(label, style: const TextStyle(color: StyleRepo.deepGrey, fontSize: 14)),
          const SizedBox(height: 4),
          isEditing
              ? TextField(
                  controller: TextEditingController(text: value),
                  onChanged: onChanged,
                )
              : Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
        ],
      ),
    );
  }
}