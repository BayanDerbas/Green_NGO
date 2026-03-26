import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: StyleRepo.glowGreen,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
