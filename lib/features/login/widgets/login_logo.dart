import 'package:flutter/material.dart';
import '../../../core/style/repo.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: StyleRepo.badgeGreen,
        border: Border.all(color: StyleRepo.glowGreen, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x803BA975),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.park_rounded,
        size: 55,
        color: Colors.white,
      ),
    );
  }
}