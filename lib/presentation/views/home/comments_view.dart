import 'package:flutter/material.dart';
import 'package:reddit_task/presentation/views/home/comment_view_item.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key, required this.comment, this.comments});

  final CommentViewItem comment;
  final List<Widget>? comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        comment,
        if (comments != null)
          IntrinsicHeight(
            child: Container(
              color: const Color(0xFF1C1C1C),
              child: Row(
                children: [
                  Container(
                    width: 0.5,
                    margin: const EdgeInsets.only(left: 20),
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: comments!,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
