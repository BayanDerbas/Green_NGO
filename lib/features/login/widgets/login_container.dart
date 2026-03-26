import 'package:flutter/material.dart';
import '../../../core/style/repo.dart';

class LoginContainer extends StatelessWidget {
  final Widget child;

  const LoginContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [StyleRepo.forestGreen, StyleRepo.deepForest],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: StyleRepo.glowGreen,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}