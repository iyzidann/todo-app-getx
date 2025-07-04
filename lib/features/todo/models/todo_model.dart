class TodoModel {
  String title;
  bool isDone;

  TodoModel({required this.title, this.isDone = false});

  // Untuk GetStorage (harus bisa toJson/fromJson)
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      isDone: json['isDone'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };
}
