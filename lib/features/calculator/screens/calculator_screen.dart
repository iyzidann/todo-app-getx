import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final controller = Get.put(CalculatorController());

  final List<String> buttons = [
    'C', '(', ')', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', '⌫', '=',
  ];

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Kalkulator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: BoxDecoration(
                    color: theme.cardColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        controller.input.value,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 28,
                          color: theme.colorScheme.onBackground.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        controller.result.value,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final label = buttons[index];
                  return Material(
                    color: _getButtonColor(label, theme),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => controller.append(label),
                      child: Center(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: _getTextColor(label, theme),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getButtonColor(String label, ThemeData theme) {
    if (label == 'C') return Colors.grey.shade800;
    if (label == '=') return Colors.grey.shade800;
    if (label == '⌫') return Colors.grey.shade800;
    if ('÷×-+'.contains(label)) return Colors.grey.shade700;
    return theme.brightness == Brightness.dark
        ? Colors.grey.shade900
        : Colors.grey.shade200;
  }

  Color _getTextColor(String label, ThemeData theme) {
    if (label == 'C') return Colors.white;
    if (label == '=') return Colors.white;
    if (label == '⌫') return Colors.white;
    if ('÷×-+'.contains(label)) return Colors.white;
    return theme.colorScheme.onBackground;
  }
}
