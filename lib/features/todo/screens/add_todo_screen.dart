import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TodoController controller = Get.find();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add_todo'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'todo_hint'.tr,
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 1),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  if (textController.text.trim().isEmpty) {
                    Get.snackbar(
                      'oops'.tr,
                      'empty_todo_warning'.tr,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }
                  controller.addTodo(textController.text.trim());
                  Get.back();
                },
                icon: const Icon(Icons.check),
                label: Text('save'.tr),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
