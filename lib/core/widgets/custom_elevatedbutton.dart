import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: StyleRepo.glowGreen,
        padding: const EdgeInsets.symmetric(vertical: 16),
        
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: StyleRepo.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}