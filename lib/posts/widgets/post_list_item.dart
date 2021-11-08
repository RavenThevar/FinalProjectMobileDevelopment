import 'package:flutter/material.dart';
import '/posts/posts.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Column(
        children:[ 
          //NetworkImage
          ListTile(
          leading: Text('${post.id}', style: textTheme.caption),
          title: Text(post.title),
          isThreeLine: true,
          subtitle: Text(post.description),
          dense: true,
          onTap: () {},
        ),
        ]),
    );
  }
}
