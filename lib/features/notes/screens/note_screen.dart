import 'package:cihuy_note/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/delete_confirmation_modal.dart';
import '../controllers/note_controller.dart';
import '../../../widgets/empty_state.dart';

class NoteScreen extends StatelessWidget {
  final controller = Get.put(NoteController());

  NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notes'.tr),
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return EmptyState(
            imageAsset: 'assets/images/empty_state.png',
            title: 'empty_note'.tr,
            subtitle: 'empty_note_subs'.tr,
            buttonText: 'add_note'.tr,
            onButtonPressed: () => Get.toNamed(AppRoutes.addNote),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: controller.notes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final note = controller.notes[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              child: InkWell(
                onTap: () => Get.toNamed(AppRoutes.viewNote, arguments: {
                  'note': note,
                  'index': index,
                }),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.sticky_note_2_outlined, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              note.content.length > 100
                                  ? '${note.content.substring(0, 100)}...'
                                  : note.content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                      onPressed: () => DeleteConfirmationModal.show(
                        context: Get.context!,
                        title: 'delete_note'.tr,
                        message: 'delete_message'.tr,
                        onConfirm: () => controller.deleteNote(index),
                      ),
                      icon: const Icon(Icons.delete_outline, size: 20),
                      visualDensity: VisualDensity.compact,
                    ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        return controller.notes.isNotEmpty
            ? FloatingActionButton(
                onPressed: () => Get.toNamed(AppRoutes.addNote),
                child: const Icon(Icons.add),
              )
            : const SizedBox.shrink();
      }),
    );
  }
}
