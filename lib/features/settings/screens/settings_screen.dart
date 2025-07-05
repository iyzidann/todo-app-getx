import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';
import '../../../controllers/language_controller.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final LanguageController languageController = Get.find();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = themeController.isDark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final containerColor = Theme.of(context).colorScheme.surfaceVariant;

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Toggle Dark Mode
            Obx(() => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isDark.value ? Icons.dark_mode : Icons.light_mode,
                        color: textColor,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "dark_mode".tr,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Switch(
                        value: isDark.value,
                        onChanged: (_) => themeController.toggleTheme(),
                      ),
                    ],
                  ),
                )),

            const SizedBox(height: 24),

            /// Toggle Bahasa (Indonesia / English)
            Obx(() {
              bool isIndo =
                  languageController.locale.value.languageCode == 'id';

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.language),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "language".tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text(isIndo ? 'ID' : 'EN'),
                    Switch(
                      value: isIndo,
                      onChanged: (val) {
                        Locale newLocale = val
                            ? const Locale('id', 'ID')
                            : const Locale('en', 'US');
                        languageController.changeLanguage(newLocale);
                      },
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
