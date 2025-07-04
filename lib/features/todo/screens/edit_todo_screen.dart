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
      appBar: AppBar(title: const Text("Edit Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: "Edit todo"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.editTodo(index, textController.text);
                Get.back();
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
