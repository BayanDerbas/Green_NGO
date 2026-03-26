import 'package:flutter/material.dart';
import 'package:green_org/core/style/repo.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;

  const CustomHeader({
    required this.title,
    this.onMenuPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: StyleRepo.glowGreen,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: onMenuPressed ??
                  () => Scaffold.of(context).openDrawer(),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}