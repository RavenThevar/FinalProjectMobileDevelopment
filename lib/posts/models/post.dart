// import 'package:equatable/equatable.dart';

// class Post extends Equatable {
//   const Post({required this.id, required this.title, required this.body});

//   final int id;
//   final String title;
//   final String body;

//   @override
//   List<Object> get props => [id, title, body];
// }

import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({required this.id, required this.title, required this.description, required this.image, required this.date, required this.author});

  final String id;
  final String title;
  final String description;
  final String image;
  final String date;
  final String author;

  @override
  List<Object> get props => [id, title, description, image, date, author];
}
