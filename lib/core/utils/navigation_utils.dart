import 'package:flutter/material.dart';
import 'package:post_list/posts_list/views/post_details_screen.dart';

void openPostDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const PostDetailsScreen(),
    ),
  );
}
