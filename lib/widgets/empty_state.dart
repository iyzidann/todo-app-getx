import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const EmptyState({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onButtonPressed,
    this.buttonColor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              height: 170,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold, fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            ElevatedButton.icon(
              onPressed: onButtonPressed,
              icon: const Icon(Icons.add),
              label: Text(buttonText),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor ??
                    theme.floatingActionButtonTheme.backgroundColor,
                foregroundColor: buttonTextColor ??
                    theme.floatingActionButtonTheme.foregroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
