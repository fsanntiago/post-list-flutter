import 'package:flutter/material.dart';
import 'package:post_list/core/extensions/string_casing_extension.dart';

import '../../models/post_model.dart';
import '../../view_models/posts_view_models.dart';

class HomeBody extends StatelessWidget {
  PostsViewModel postsViewModel;
  HomeBody({
    Key? key,
    required this.postsViewModel,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    if (postsViewModel.loading) {
      return const CircularProgressIndicator();
    }
    if (postsViewModel.postError != null) {
      return Container();
    }

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          PostModel postModel = postsViewModel.postListModel[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postModel.title.toCapitalized(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                postModel.body.toCapitalized(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 20,
          thickness: 2,
        ),
        itemCount: postsViewModel.postListModel.length,
      ),
    );
  }
}
