import 'package:flutter/material.dart';
import 'package:post_list/core/utils/navigation_utils.dart';
import 'package:post_list/posts_list/views/widgets/post_item_widget.dart';

import '../../models/post_model.dart';
import '../../view_models/posts_view_models.dart';

class HomeBody extends StatelessWidget {
  final PostsViewModel postsViewModel;

  const HomeBody({
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
          return PostItemWidget(
            postModel: postModel,
            onTap: () async {
              postsViewModel.setSelectedPost(postModel);
              openPostDetails(context);
            },
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
