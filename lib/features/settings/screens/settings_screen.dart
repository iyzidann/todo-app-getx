import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          Obx(() => SwitchListTile(
                title: const Text("Dark Mode"),
                secondary: Icon(themeController.isDark.value
                    ? Icons.dark_mode
                    : Icons.light_mode),
                value: themeController.isDark.value,
                onChanged: (_) => themeController.toggleTheme(),
              )),
        ],
      ),
    );
  }
}
