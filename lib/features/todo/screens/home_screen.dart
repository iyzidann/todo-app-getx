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
          return Center(
            child: Text('empty_todo'.tr, style: TextStyle(fontSize: 16)),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: controller.todos.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return InkWell(
              onTap: () => controller.toggleTodo(index),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: todo.isDone,
                      onChanged: (_) => controller.toggleTodo(index),
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        todo.title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          decoration: todo.isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.editTodo, arguments: {
                        'index': index,
                        'value': todo.title,
                      }),
                      icon: const Icon(Icons.edit, size: 20),
                      visualDensity: VisualDensity.compact,
                    ),
                    IconButton(
                      onPressed: () => controller.removeTodo(index),
                      icon: const Icon(Icons.delete_outline, size: 20),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
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
