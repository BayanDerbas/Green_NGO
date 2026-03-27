import 'package:flutter/material.dart';
import 'package:green_org/core/assets/assets.gen.dart';
import '../../../core/style/repo.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: StyleRepo.badgeGreen,
        border: Border.all(color: StyleRepo.white, width: 5),
        boxShadow: const [
          BoxShadow(
            color: StyleRepo.forestGreen,
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          Assets.images.logoLight.path,
          width: 105,
          height: 105,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
