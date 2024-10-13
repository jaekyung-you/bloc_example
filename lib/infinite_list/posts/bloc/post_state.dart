
/// part: 하나의 라이브러리를 여러 파일로 나눠 관리할 때 사용
/// 주 파일에서 해당 파일이 라이브러리의 일부임을 선언할 때 사용
/// part of: 나눠진 파일에서 이 파일이 어떤 라이브러리의 일부인지를 선언할 때 사용
part of 'post_bloc.dart';

// import 'package:equatable/equatable.dart';
// import '../models/post.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''
    PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length}
    ''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];

}
