class ProjetoModel {
  final int id;
  final String title;
  final String image;
  final String author;
  final String date;
  final String group;
  final double rating;

  ProjetoModel({
    required this.id,
    required this.title,
    required this.image,
    required this.author,
    required this.date,
    required this.group,
    required this.rating,
  });

  factory ProjetoModel.fromJson(Map<String, dynamic> json) => ProjetoModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        author: json['author'],
        date: json['date'],
        group: json['group'],
        rating: json['rating'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'author': author,
        'date': date,
        'group': group,
        'rating': rating,
      };
      
  Map<String, Object> toObject() => {
        'id': id,
        'title': title,
        'image': image,
        'author': author,
        'date': date,
        'group': group,
        'rating': rating,
      };
}
