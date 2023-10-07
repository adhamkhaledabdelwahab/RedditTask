import 'package:flutter/material.dart';
import 'package:reddit_task/core/images.dart';
import 'package:reddit_task/presentation/widgets/custom_like_button.dart';

class VideoDetailsView extends StatelessWidget {
  const VideoDetailsView({
    super.key,
    required this.isLikedNotifier,
  });

  final ValueNotifier<bool> isLikedNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              AppImages.imgParrot,
                              filterQuality: FilterQuality.high,
                            ).image,
                            colorFilter: ColorFilter.mode(
                              Colors.blueAccent.withOpacity(0.4),
                              BlendMode.srcOver,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Xury46",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "After a year of collecting parts for this build. I present my finished Heavy-9 (Thocky typing test at the end!)",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ValueListenableBuilder(
                  valueListenable: isLikedNotifier,
                  builder: (context, isLikedNotifierValue, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomLikeButton(
                          value: isLikedNotifierValue,
                          slideUp: true,
                          onTap: !isLikedNotifierValue
                              ? () =>
                                  isLikedNotifier.value = !isLikedNotifierValue
                              : null,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "266",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomLikeButton(
                          value: !isLikedNotifierValue,
                          slideUp: false,
                          onTap: isLikedNotifierValue
                              ? () =>
                                  isLikedNotifier.value = !isLikedNotifierValue
                              : null,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    //TODO
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        "61",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    //TODO
                  },
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.logout,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
