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
      appBar: AppBar(
        title: const Text("Tambah Catatan"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(
                hintText: "Judul catatan",
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: contentC,
                decoration: const InputDecoration(
                  hintText: "Tulis isi catatan...",
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  if (titleC.text.trim().isEmpty &&
                      contentC.text.trim().isEmpty) {
                    Get.snackbar("Oops", "Catatan tidak boleh kosong",
                        snackPosition: SnackPosition.BOTTOM);
                    return;
                  }
                  controller.addNote(
                    titleC.text.trim(),
                    contentC.text.trim(),
                  );
                  Get.back();
                },
                icon: const Icon(Icons.check),
                label: const Text("Simpan"),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
