class TodoModel {
  String title;
  bool isDone;
  DateTime createdAt;

  TodoModel({
    required this.title,
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Untuk GetStorage (harus bisa toJson/fromJson)
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      isDone: json['isDone'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
        'createdAt': createdAt.toIso8601String(),
      };
}
