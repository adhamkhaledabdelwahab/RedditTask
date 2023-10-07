import 'package:flutter/material.dart';
import 'package:reddit_task/core/images.dart';
import 'package:reddit_task/presentation/widgets/custom_like_button.dart';

class CommentViewItem extends StatefulWidget {
  const CommentViewItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    required this.timestamp,
    this.separate = true,
    required this.onMoreClick,
    required this.onReplyClick,
  });

  final String title;
  final String timestamp;
  final String? subtitle;
  final String body;
  final bool separate;
  final Function() onMoreClick;
  final Function() onReplyClick;

  @override
  State<CommentViewItem> createState() => _CommentViewItemState();
}

class _CommentViewItemState extends State<CommentViewItem> {
  late final ValueNotifier<bool> _isLikedNotifier;

  @override
  void initState() {
    super.initState();
    _isLikedNotifier = ValueNotifier(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: widget.separate ? 5 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF1C1C1C),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    child: Image.asset(AppImages.imgParrot),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1C1C1C),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.title} . ${widget.timestamp}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                      ),
                    ),
                    if (widget.subtitle != null)
                      Text(
                        widget.subtitle!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white38,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.body,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _isLikedNotifier,
            builder: (context, isLikedNotifierValue, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: widget.onMoreClick,
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.white60,
                      size: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: InkWell(
                      onTap: widget.onReplyClick,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.turn_left,
                            color: Colors.white60,
                            size: 28,
                          ),
                          Text(
                            "Reply",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomLikeButton(
                      value: isLikedNotifierValue,
                      slideUp: true,
                      onTap: !isLikedNotifierValue
                          ? () {
                              _isLikedNotifier.value = true;
                            }
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomLikeButton(
                    value: !isLikedNotifierValue,
                    slideUp: false,
                    onTap: isLikedNotifierValue
                        ? () {
                            _isLikedNotifier.value = false;
                          }
                        : null,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
