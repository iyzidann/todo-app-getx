import 'package:get/get.dart';
import '../features/main/screens/main_screen.dart';
import '../features/todo/screens/home_screen.dart';
import '../features/todo/screens/add_todo_screen.dart';
import '../features/todo/screens/edit_todo_screen.dart';
import '../features/notes/screens/note_screen.dart';
import '../features/notes/screens/add_note_screen.dart';
import '../features/notes/screens/view_note_screen.dart';

class AppRoutes {
  static const main = '/';
  static const home = '/todo';
  static const addTodo = '/add-todo';
  static const editTodo = '/edit-todo';
  static const notes = '/notes';
  static const addNote = '/add-note';
  static const viewNote = '/view-note';

  static final pages = [
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: addTodo, page: () => AddTodoScreen()),
    GetPage(name: editTodo, page: () => EditTodoScreen()),
    GetPage(name: notes, page: () => NoteScreen()),
    GetPage(name: addNote, page: () => AddNoteScreen()),
    GetPage(name: viewNote, page: () => ViewNoteScreen()),
  ];
}
