import 'package:flutter/material.dart';
import 'package:post_list/core/extensions/string_casing_extension.dart';
import 'package:post_list/posts_list/view_models/posts_view_models.dart';
import 'package:provider/provider.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostsViewModel postsViewModel = context.watch<PostsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          postsViewModel.selectedPost!.title.toCapitalized(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              postsViewModel.selectedPost!.title.toCapitalized(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              postsViewModel.selectedPost!.body.toCapitalized(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
