import 'package:flutter/material.dart';

class AppBarTitleView extends StatelessWidget {
  const AppBarTitleView({super.key, required this.title, required this.image});

  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 13,
          backgroundColor: Colors.grey.shade400,
          child: image,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
