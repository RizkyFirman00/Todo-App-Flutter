class Item {
  String? id;
  String title;
  String subTitle;
  bool isCompleted;

  Item({
    this.id,
    required this.title,
    this.subTitle = "",
    this.isCompleted = false,
  });

  factory Item.fromMap(Map<String, dynamic> map, String id) {
    return Item(
      id: id,
      title: map['title'],
      subTitle: map['subTitle'],
      isCompleted: map['isCompleted'] == true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'isCompleted': isCompleted ? true : false,
    };
  }
}
