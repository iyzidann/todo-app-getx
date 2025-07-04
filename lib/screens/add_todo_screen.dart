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
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Todo",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addTodo(textController.text);
                Get.back(); // kembali ke HomeScreen
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
