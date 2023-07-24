part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class PostsInitialFetchEvent extends PostsEvent {}

class PostAddEvent extends PostsEvent {}

class PostUpdateEvent extends PostsEvent {}

class PostPatchEvent extends PostsEvent {}

class PostDeleteEvent extends PostsEvent {}

class HomeNavigateToGetEvent extends PostsEvent {}
