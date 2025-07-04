class NoteModel {
  final String title;
  final String content;
  final DateTime createdAt;

  NoteModel({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'createdAt': createdAt.toIso8601String(),
      };
}