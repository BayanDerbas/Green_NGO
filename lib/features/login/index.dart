import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/widgets/error_text.dart';
import '../../core/style/repo.dart';
import 'controller/controller.dart';
import 'widgets/login_container.dart';
import 'widgets/login_logo.dart';
import 'widgets/login_text_field.dart';
import 'widgets/login_password_field.dart';
import 'widgets/login_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E3C2F),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 330),
            child: LoginContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LoginLogo(),
                  const Gap(25),

                  const Text(
                    "نظام إدارة المستفيدين",
                    style: TextStyle(
                      color: StyleRepo.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(6),
                  const Text(
                    "منظمة أخضر",
                    style: TextStyle(color: Color(0xFFB8D7C8), fontSize: 16),
                  ),

                  const Gap(35),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الايميل",
                      style: TextStyle(
                        color: StyleRepo.white.withOpacity(0.85),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Gap(7),
                  LoginTextField(
                    controller: controller.emailController,
                    icon: Icons.email,
                  ),

                  const Gap(18),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "كلمة المرور",
                      style: TextStyle(
                        color: StyleRepo.white.withOpacity(0.85),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Gap(7),
                  LoginPasswordField(
                    controller: controller.passwordController,
                    isHidden: controller.isPasswordHidden,
                    toggle: controller.togglePassword,
                  ),
                  const Gap(25),

                  Obx(() => ErrorText(text: controller.errorMessage.value)),

                  const Gap(7),

                  LoginButton(onPressed: controller.login),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
