import 'package:flutter/material.dart';
import 'package:post_list/core/extensions/string_casing_extension.dart';

import '../../models/post_model.dart';

class PostItemWidget extends StatelessWidget {
  final PostModel postModel;
  final Function() onTap;

  const PostItemWidget({
    Key? key,
    required this.postModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
