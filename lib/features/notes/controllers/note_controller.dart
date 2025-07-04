import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/note_model.dart';

class NoteController extends GetxController {
  final notes = <NoteModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    final saved = box.read<List>('notes');
    if (saved != null) {
      notes.assignAll(saved.map((e) => NoteModel.fromJson(Map<String, dynamic>.from(e))));
    }

    ever(notes, (_) {
      box.write('notes', notes.map((e) => e.toJson()).toList());
    });

    super.onInit();
  }

  void addNote(String title, String content) {
    notes.insert(
      0,
      NoteModel(title: title, content: content, createdAt: DateTime.now()),
    );
  }

  void editNote(int index, String title, String content) {
    final oldNote = notes[index];
    notes[index] = NoteModel(
      title: title,
      content: content,
      createdAt: oldNote.createdAt,
    );
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }
}