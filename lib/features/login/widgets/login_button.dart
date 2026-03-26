import 'package:flutter/material.dart';
import '../../../core/style/repo.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x803BA975), 
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: StyleRepo.glowGreen,
            padding: const EdgeInsets.symmetric(vertical: 14),
            elevation: 0, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            "تسجيل الدخول",
            style: TextStyle(
              color: StyleRepo.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}