import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  RxBool isDark = false.obs;

  @override
  void onInit() {
    isDark.value = _loadThemeFromStorage();
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
    super.onInit();
  }

  bool _loadThemeFromStorage() => _storage.read(_key) ?? false;

  void _saveThemeToStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);

  void toggleTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToStorage(isDark.value);
  }
}
