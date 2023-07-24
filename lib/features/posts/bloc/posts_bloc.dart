import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_with_apis/features/posts/models/post_data_ui_model.dart';
import 'package:flutter_bloc_with_apis/features/posts/repos/repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
    on<PostUpdateEvent>(postUpdateEvent);
    on<PostDeleteEvent>(postDeleteEvent);
    on<PostPatchEvent>(postPatchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await Repo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await Repo.addPost();

    if (success) {
      print("post success");
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }

  FutureOr<void> postUpdateEvent(
      PostUpdateEvent event, Emitter<PostsState> emit) async {
    bool success = await Repo.updatePost();

    if (success) {
      print("update success");
      emit(PostsUpdateSuccessState());
    } else {
      emit(PostsUpdateErrorState());
    }
  }

  FutureOr<void> postDeleteEvent(
      PostDeleteEvent event, Emitter<PostsState> emit) async {
    bool success = await Repo.deletePost();

    if (success) {
      print("delete success");
      emit(PostsDeleteSuccessState());
    } else {
      emit(PostsDeleteErrorState());
    }
  }

  FutureOr<void> postPatchEvent(
      PostPatchEvent event, Emitter<PostsState> emit) async {
    bool success = await Repo.patchPost();

    if (success) {
      print("patch success");
      emit(PostsPatchSuccessState());
    } else {
      emit(PostsPatchErrorState());
    }
  }
}
