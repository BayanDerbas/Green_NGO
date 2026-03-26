import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_org/core/config/app_binding.dart';
import 'package:green_org/core/config/app_builder.dart';
import 'package:green_org/core/routes/routes.dart';
import 'package:green_org/core/style/style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(kStorageApp);
  await Get.putAsync<AppBuilder>(() => AppBuilder().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppStyle.LightTheme,
      initialBinding: AppBinding(),
      initialRoute: AppRouting.initial,
      getPages: AppRouting.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
