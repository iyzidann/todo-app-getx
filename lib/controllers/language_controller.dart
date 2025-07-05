import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  final _storage = GetStorage();
  final _key = 'language';

  Rx<Locale> locale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    final saved = _storage.read(_key);
    if (saved != null) {
      final parts = saved.split('_');
      locale.value = Locale(parts[0], parts[1]);
      Get.updateLocale(locale.value);
    }
    super.onInit();
  }

  void changeLanguage(Locale newLocale) {
    locale.value = newLocale;
    Get.updateLocale(newLocale);
    _storage.write(_key, "${newLocale.languageCode}_${newLocale.countryCode}");
  }
}
