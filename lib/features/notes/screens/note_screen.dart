import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class NoteScreen extends StatelessWidget {
  final controller = Get.put(NoteController());

  NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return const Center(child: Text("Belum ada catatan"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  note.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    note.content.length > 100
                        ? '${note.content.substring(0, 100)}...'
                        : note.content,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                onTap: () => Get.toNamed('/view-note', arguments: {
                  'note': note,
                  'index': index,
                }),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => controller.deleteNote(index),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-note'),
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
