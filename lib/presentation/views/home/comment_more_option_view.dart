import 'package:flutter/material.dart';
import 'package:reddit_task/presentation/views/home/delete_comment_view.dart';

class CommentMoreOptionView extends StatelessWidget {
  const CommentMoreOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: const Text(
              "Share",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
            title: const Text(
              "Save",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            title: const Text(
              "Stop reply notifications",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.copy,
              color: Colors.white,
            ),
            title: const Text(
              "Copy text",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.close_fullscreen,
              color: Colors.white,
            ),
            title: const Text(
              "Collapse thread",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            title: const Text(
              "Edit",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => const DeleteCommentView(),
              );
            },
            minLeadingWidth: 10,
            leading: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
            title: const Text(
              "Delete",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Close",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
