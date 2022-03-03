class Data {
  final int id;
  final String title;
  final String content;
  final String date;
  final int parent;

  Data(this.id, this.title, this.content, this.date, this.parent);
  factory Data.fromMap(Map<String, dynamic> json) {
    return Data(
      json['id'],
      json['title']['rendered'],
      json['content']['rendered'],
      json['date'],
      json['parent'],
    );
  }
}
