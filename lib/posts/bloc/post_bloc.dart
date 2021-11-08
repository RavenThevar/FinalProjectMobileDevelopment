import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../posts.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_loggingIn_state.dart';

// class PostBloc extends Bloc<PostEvent, PostState>{
//   PostBloc() : super(const PostState()) {
//     final response =
//         WebSocketChannel.connect(Uri.parse('ws://besquare-demo.herokuapp.com'));
// }
// }

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  late WebSocketChannel channel;

  PostBloc() : super(PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    channel =
        WebSocketChannel.connect(Uri.parse('ws://besquare-demo.herokuapp.com'));
    channel.stream.listen((data) {
      print(data);
    });
  }

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostFetched) {
      print("Post Fetched is called.");
      // final body = json.decode(response.body) as List;
      // body.map((dynamic json) {
      //   return Post(
      //       id: json['id'] as String,
      //       title: json['title'] as String,
      //       description: json['description'] as String,
      //       image: json['image'] as String,
      //       date: json['date'] as String,
      //       author: json['author'] as String);
      // }).toList();

      // StreamBuilder(
      //   stream: response.stream,
      //   builder: (context, snapshot) {
      //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
      //   },
      // );
    } else if (event is FetchPosts) {
      // isFetching = true;
      //  TODO: change isFetching to true
      // TODOD: get the data
      var list;
      // channel.stream.listen((data) => setState((FetchPosts) => list.add(data)));
    } else if (event is LogIn) {
      print(event.author);
      channel.sink.add(json.encode({
        "type": "sign_in",
        "data": {
          "name": event.author
        }
      })
      );

      yield LoggingIn();
    }
  }

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    print("On post fetched...");

    // if (state.hasReachedMax) return;
    // try {
    //   if (state.status == PostStatus.initial) {
    //     final posts = await _fetchPosts();
    //     return emit(state.copyWith(
    //       status: PostStatus.success,
    //       posts: posts,
    //       hasReachedMax: false,
    //     ));
    //   }
    //   final posts = await _fetchPosts(state.posts.length);
    //   posts.isEmpty
    //       ? emit(state.copyWith(hasReachedMax: true))
    //       : emit(
    //           state.copyWith(
    //             status: PostStatus.success,
    //             posts: List.of(state.posts)..addAll(posts),
    //             hasReachedMax: false,
    //           ),
    //         );
    // } catch (_) {
    //   emit(state.copyWith(status: PostStatus.failure));
    // }
  }

  setState(Function(FetchPosts) param0) {}

  // Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
  //   final response = await httpClient.get(
  //     Uri.https(
  //       'jsonplaceholder.typicode.com',
  //       '/posts',
  //       <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     final body = json.decode(response.body) as List;
  //     return body.map((dynamic json) {
  //       return Post(
  //           id: json['id'] as String,
  //           title: json['title'] as String,
  //           description: json['description'] as String,
  //           image: json['image'] as String,
  //           date: json['date'] as String,
  //           author: json['author'] as String);
  //     }).toList();
  //   }
  //   throw Exception('error fetching posts');
  // }
}

