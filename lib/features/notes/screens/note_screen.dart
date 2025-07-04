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
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(
                note.content.length > 50
                    ? '${note.content.substring(0, 50)}...'
                    : note.content,
              ),
              onTap: () => Get.toNamed('/view-note', arguments: {
                'note': note,
                'index': index,
              }),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => controller.deleteNote(index),
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
