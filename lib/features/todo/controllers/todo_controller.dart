import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final todos = <TodoModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    final saved = box.read<List>('todos');
    if (saved != null) {
      todos.assignAll(saved.map((e) => TodoModel.fromJson(e)).toList());
    }

    ever(todos, (_) {
      box.write('todos', todos.map((e) => e.toJson()).toList());
    });
  }

  void addTodo(String title) {
    if (title.isNotEmpty) {
      todos.add(TodoModel(title: title));
    }
  }

  void toggleTodo(int index) {
    final item = todos[index];
    todos[index] = TodoModel(title: item.title, isDone: !item.isDone);
  }

  void editTodo(int index, String newTitle) {
    final item = todos[index];
    todos[index] = TodoModel(title: newTitle, isDone: item.isDone);
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}