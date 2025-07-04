import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class AddNoteScreen extends StatelessWidget {
  final controller = Get.find<NoteController>();

  final titleC = TextEditingController();
  final contentC = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: contentC,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(labelText: "Isi Catatan"),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.addNote(titleC.text, contentC.text);
                Get.back();
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
