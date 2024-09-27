class Item {
  final int? id;
  final String title;
  final String subTitle;
  bool isCompleted;

  Item({
    this.id,
    required this.title,
    this.subTitle = "",
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['title'],
      subTitle: map['subTitle'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
