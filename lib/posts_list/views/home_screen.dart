import 'package:flutter/material.dart';
import 'package:post_list/posts_list/views/widgets/body.dart';

import 'package:provider/provider.dart';

import '../view_models/posts_view_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostsViewModel postsViewModel = context.watch<PostsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Column(
        children: [
          HomeBody(postsViewModel: postsViewModel),
        ],
      ),
    );
  }
}
