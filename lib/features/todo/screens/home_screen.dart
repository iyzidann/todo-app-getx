import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../../../controllers/theme_controller.dart';
import '../../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final TodoController controller = Get.put(TodoController());
  final ThemeController themeController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Obx(() {
        if (controller.todos.isEmpty) {
          return const Center(child: Text("Todo kosong 😴"));
        }
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) => controller.toggleTodo(index),
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => Get.toNamed(AppRoutes.editTodo, arguments: {
                      'index': index,
                      'value': todo.title,
                    }),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.removeTodo(index),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}
