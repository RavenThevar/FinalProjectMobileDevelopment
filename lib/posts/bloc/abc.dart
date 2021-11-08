import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts.dart';

class ABC extends Bloc<PostEvent, PostState>{
  ABC(PostState initialState) : super(initialState);
  
  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {}
  
}