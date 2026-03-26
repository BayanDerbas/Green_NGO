import 'package:flutter/material.dart';
import '../../core/style/repo.dart';

class ErrorText extends StatelessWidget {
  final String text;
  const ErrorText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: StyleRepo.errorBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: StyleRepo.errorBorder,width: 1.5),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: StyleRepo.errorText,
          fontSize: 14,
        ),
      ),
    );
  }
}