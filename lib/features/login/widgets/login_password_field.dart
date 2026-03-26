import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/repo.dart';

class LoginPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final RxBool isHidden;
  final VoidCallback toggle;

  const LoginPasswordField({
    super.key,
    required this.controller,
    required this.isHidden,
    required this.toggle,
  });

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _focused ? StyleRepo.glowGreen : StyleRepo.translucentBorder,
            width: 0.5,
          ),
        ),
        child: TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: widget.isHidden.value,
          style: const TextStyle(color: StyleRepo.white),
          cursorColor: StyleRepo.white,
          decoration: InputDecoration(
            filled: false,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            prefixIcon: IconButton(
              onPressed: widget.toggle,
              icon: Icon(
                widget.isHidden.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: StyleRepo.glowGreen,
              ),
            ),
            suffixIcon: const Icon(
              Icons.lock_outline_rounded,
              color: StyleRepo.glowGreen,
            ),
          ),
        ),
      );
    });
  }
}