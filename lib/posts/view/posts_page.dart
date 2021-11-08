import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/posts/posts.dart';

class PostsPage extends StatelessWidget {
  set isFetching(bool isFetching) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => PostBloc()..add(FetchPosts(isFetching = true)),
        child: PostsList(),
      ),
    );
  }
}