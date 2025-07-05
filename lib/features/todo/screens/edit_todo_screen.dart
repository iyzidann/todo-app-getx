import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class EditTodoScreen extends StatelessWidget {
  final TodoController controller = Get.find();
  final TextEditingController textController = TextEditingController();

  EditTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final int index = args['index'];
    final String oldValue = args['value'];

    textController.text = oldValue;

    return Scaffold(
      appBar: AppBar(
        title: Text('edit_todo'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final newText = textController.text.trim();
              if (newText.isEmpty) {
                Get.snackbar(
                  'oops'.tr,
                  'empty_todo_warning'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
              controller.editTodo(index, newText);
              Get.back();
            },
          )
        ],
      ),
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
              autofocus: true,
            ),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
