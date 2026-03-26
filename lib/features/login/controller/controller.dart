import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_org/core/config/app_builder.dart';
import 'package:green_org/core/routes/routes.dart';
import 'package:green_org/core/utils/validator.dart';
import 'package:green_org/core/widgets/loading/loading.dart';
import 'package:green_org/features/login/model/login_model.dart';
import '../../../core/services/rest_api/rest_api.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final errorMessage = "".obs;

  AppBuilder get app => Get.find<AppBuilder>();
  final api = APIService.instance;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    errorMessage.value = "";
    Loading.show();

    final email = emailController.text.trim();
    final pass = passwordController.text.trim();

    final emailError = Validator.validateEmail(email);
    if (emailError != null) {
      errorMessage.value = emailError;
      return;
    }

    final passError = Validator.validatePassword(pass);
    if (passError != null) {
      errorMessage.value = passError;
      return;
    }

    ResponseModel response = await api.request(
      Request(
        endPoint: EndPoints.login,
        method: RequestMethod.post,
        body: {"email": email, "password": pass},
        fromJson: (json) => LoginModel.fromJson(json),
      ),
    );
    Loading.close();

    if (!response.success) {
      errorMessage.value = response.message;
      return;
    }

    LoginModel data = response.data;

    await app.saveLogin(data);

    api.setToken(data.token);

    Get.offAllNamed(Pages.dashboard.route);
  }
}
