class TaskModel {
  int? id;
  String title;
  String decription;

  TaskModel({this.id, required this.title, required this.decription});

  // Convert to Map for GetStorage
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? DateTime.now().millisecondsSinceEpoch, // Generate ID if not present
      'title': title,
      'decription': decription,
    };
  }

  // Create instance from Map
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      decription: map['decription'],
    );
  }
}
