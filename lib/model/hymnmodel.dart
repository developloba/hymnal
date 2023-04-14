class HymnModel {
  final int id;

  final String title;
  final String content;

  HymnModel({required this.id, required this.title, required this.content});
  factory HymnModel.fromJson(Map<String, dynamic> json) {
    return HymnModel(
        id: json['id'], title: json['Title'], content: json['content']);
  }
}
