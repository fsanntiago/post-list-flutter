import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';
import 'api_status.dart';

class PostRepository {
  static Future<Object> getPosts() async {
    try {
      final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: PostModel.fromJson(response.body),
        );
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'Unknown Error');
    }
  }
}
