import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';
import 'controllers/theme_controller.dart';
import 'localization/app_translations.dart';
import 'controllers/language_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final languageController = Get.put(LanguageController());

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetX Todo + Notes',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
        translations: AppTranslations(),
        locale: languageController.locale.value,
        fallbackLocale: const Locale('en', 'US'),
        initialRoute: AppRoutes.main,
        getPages: AppRoutes.pages,
      );
    });
  }
}