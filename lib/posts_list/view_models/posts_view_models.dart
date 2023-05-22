import 'package:flutter/material.dart';

import '../models/post_error.dart';
import '../models/post_model.dart';
import '../repository/api_status.dart';
import '../repository/post_repository.dart';

class PostsViewModel extends ChangeNotifier {
  bool _loading = false;
  List<PostModel> _postListModel = [];
  PostError? _postError;
  PostModel? _selectedPost;

  bool get loading => _loading;
  List<PostModel> get postListModel => _postListModel;
  PostError? get postError => _postError;
  PostModel? get selectedPost => _selectedPost;

  PostsViewModel() {
    getPosts();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setPostListModel(List<PostModel> postListModel) {
    _postListModel = postListModel;
  }

  setPostError(PostError postError) {
    _postError = postError;
  }

  setSelectedPost(PostModel postModel) {
    _selectedPost = postModel;
  }

  getPosts() async {
    setLoading(true);
    var response = await PostRepository.getPosts();
    if (response is Success) {
      setPostListModel(response.response as List<PostModel>);
    }
    if (response is Failure) {
      PostError postError = PostError(
        code: response.code,
        message: response.errorResponse as String,
      );
      setPostError(postError);
    }
    setLoading(false);
  }
}
