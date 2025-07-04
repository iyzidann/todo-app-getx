import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../models/note_model.dart';

class ViewNoteScreen extends StatelessWidget {
  final NoteController controller = Get.find();
  final int index = Get.arguments['index'];
  final NoteModel note = Get.arguments['note'];

  final titleC = TextEditingController();
  final contentC = TextEditingController();

  ViewNoteScreen({super.key}) {
    titleC.text = note.title;
    contentC.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lihat/Edit Catatan"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              controller.editNote(index, titleC.text, contentC.text);
              Get.back();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: contentC,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(labelText: "Isi Catatan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}