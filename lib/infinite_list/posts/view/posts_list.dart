import 'package:bloc_example/infinite_list/posts/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_loader.dart';
import '../widgets/post_list_item.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      switch (state.status) {
        case PostStatus.success:
          if (state.posts.isEmpty) {
            return const Center(
              child: Text('no posts'),
            );
          }
          return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
              itemBuilder: (context, index) {
                return index >= state.posts.length ?
                    const BottomLoader() :
                    PostListItem(post: state.posts[index]);
              });
        case PostStatus.initial:
          return const Center(child: CircularProgressIndicator(),);
        case PostStatus.failure:
          return const Center(
            child: Text('failed to fetch posts'),
          );
      }
    });
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
