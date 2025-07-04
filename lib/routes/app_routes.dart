import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/add_todo_screen.dart';
import '../screens/edit_todo_screen.dart';

class AppRoutes {
  static const home = '/';
  static const addTodo = '/add';
  static const editTodo = '/edit';

  static final pages = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: addTodo, page: () => AddTodoScreen()),
    GetPage(name: editTodo, page: () => EditTodoScreen()),
  ];
}

