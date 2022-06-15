import 'package:aplikasi_hello_world/infinite_list_bloc/model/post.dart';
import 'package:bloc/bloc.dart';

class PostEvent {}

abstract class PostState {}

class PostUnitialized extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts;
  bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax});

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax}) {
    return PostLoaded(
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUnitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if (state is PostUnitialized) {
      posts = await Post.connectToAPI(0, 10);
      yield PostLoaded(posts: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToAPI(postLoaded.posts.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(
              hasReachedMax: true,
            )
          : PostLoaded(
              posts: postLoaded.posts,
              hasReachedMax: false,
            );
    }
  }
}
