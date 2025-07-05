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
        title: Text('add_note'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: InputDecoration(
                hintText: 'note_title_hint'.tr,
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: contentC,
                decoration: InputDecoration(
                  hintText: 'note_content_hint'.tr,
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
                    Get.snackbar('oops'.tr, 'empty_note_warning'.tr,
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
                label: Text('save'.tr),
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
