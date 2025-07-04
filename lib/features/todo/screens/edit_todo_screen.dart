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
        title: const Text("Edit Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "Edit todo...",
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
                      "Gagal",
                      "Todo tidak boleh kosong",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  controller.editTodo(index, textController.text.trim());
                  Get.back();
                },
                icon: const Icon(Icons.check),
                label: const Text("Simpan Perubahan"),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
