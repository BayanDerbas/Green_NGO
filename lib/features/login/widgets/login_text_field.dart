import 'package:flutter/material.dart';
import '../../../core/style/repo.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.icon,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _focused ? StyleRepo.glowGreen : StyleRepo.translucentBorder,
          width: _focused ? 1 : 0.5,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        style: const TextStyle(color: StyleRepo.white),
        cursorColor: StyleRepo.white,
        decoration: InputDecoration(
          filled: false,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.white70),
          suffixIcon: Icon(widget.icon, color: StyleRepo.glowGreen),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}