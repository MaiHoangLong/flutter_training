import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_apis/features/posts/bloc/posts_bloc.dart';
import 'package:flutter_bloc_with_apis/features/posts/ui/posts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final PostsBloc postsBloc = PostsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          TextButton(
            child: const Text("Post"),
            onPressed: () {
              postsBloc.add(PostAddEvent());
            },
          ),
          TextButton(
            child: const Text("Update"),
            onPressed: () {
              postsBloc.add(PostUpdateEvent());
            },
          ),
          TextButton(
            child: const Text("Patch"),
            onPressed: () {
              postsBloc.add(PostPatchEvent());
            },
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              postsBloc.add(PostDeleteEvent());
            },
          ),
          TextButton(
            child: const Text("Get"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PostsPage()));
            },
          )
        ],
      ),
    );
  }
}
