import 'package:flutter/material.dart';
import 'package:reddit_task/core/icons.dart';

class CustomLikeButton extends StatefulWidget {
  const CustomLikeButton({
    super.key,
    required this.value,
    required this.slideUp,
    required this.onTap,
    this.height,
  });

  final bool value;
  final bool slideUp;
  final Function()? onTap;
  final double? height;

  @override
  State<CustomLikeButton> createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton> {
  late final ValueNotifier<bool> _isLikedAnimateNotifier;

  @override
  void initState() {
    super.initState();
    _isLikedAnimateNotifier = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap?.call();
          _isLikedAnimateNotifier.value = true;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: _isLikedAnimateNotifier,
        builder: (context, isLikedAnimateNotifierValue, child) {
          return AnimatedContainer(
            height: widget.height ?? 35,
            curve: Curves.easeInOut,
            duration: const Duration(
              milliseconds: 150,
            ),
            padding: isLikedAnimateNotifierValue && widget.value
                ? EdgeInsets.only(
                    bottom: widget.slideUp ? 10 : 0,
                    top: !widget.slideUp ? 10 : 0,
                  )
                : EdgeInsets.zero,
            onEnd: () {
              _isLikedAnimateNotifier.value = false;
            },
            child: Column(
              mainAxisAlignment: widget.slideUp
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Image.asset(
                  widget.slideUp
                      ? (widget.value
                          ? AppIcons.icArrowUpFilled
                          : AppIcons.icArrowUpOutlined)
                      : (widget.value
                          ? AppIcons.icArrowDownFilled
                          : AppIcons.icArrowDownOutlined),
                  color: widget.slideUp
                      ? (widget.value ? Colors.red : Colors.white70)
                      : (widget.value ? Colors.blue : Colors.white70),
                  height: 25,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
