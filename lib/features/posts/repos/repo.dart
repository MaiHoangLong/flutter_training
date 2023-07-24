import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_with_apis/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class Repo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "This is a post request",
        "body": "This post request is done by MHL",
        "userId": "23"
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> updatePost() async {
    var client = http.Client();

    try {
      var response = await client.put(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          body: {
            "id": "1",
            "title": "This is a update request",
            "body": "This update request is done by MHL",
            "userId": "23"
          });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> deletePost() async {
    var client = http.Client();

    try {
      var response = await client
          .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> patchPost() async {
    var client = http.Client();

    try {
      var response = await client.patch(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          body: {"title": "this is a title after being patch"});

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
