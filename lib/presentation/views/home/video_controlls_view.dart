// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reddit_task/core/icons.dart';
import 'package:reddit_task/presentation/widgets/custom_slider.dart';
import 'package:video_player/video_player.dart';

class VideoControlsView extends StatelessWidget {
  const VideoControlsView({
    super.key,
    required this.isPlayingNotifier,
    required this.sliderNotifier,
    required this.volumeNotifier,
    required this.videoPlayerController,
  });

  final ValueNotifier<bool> isPlayingNotifier;
  final ValueNotifier<double> sliderNotifier;
  final ValueNotifier<double> volumeNotifier;
  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ValueListenableBuilder(
            valueListenable: isPlayingNotifier,
            builder: (context, isPlayingNotifierValue, child) {
              return InkWell(
                onTap: isPlayingNotifierValue
                    ? videoPlayerController.pause
                    : videoPlayerController.play,
                child: Icon(
                  isPlayingNotifierValue ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
              );
            },
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: sliderNotifier,
              builder: (context, sliderNotifierValue, child) {
                final min = (sliderNotifierValue ~/ 60).toInt();
                final sec = (sliderNotifierValue % 60).toInt();
                return Row(
                  children: [
                    Expanded(
                      child: CustomSlider(
                        thumbColor: Colors.white,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey.shade900,
                        value: sliderNotifierValue,
                        min: 0,
                        max: videoPlayerController.value.duration.inSeconds
                            .toDouble(),
                        onChanged: (nVal) => sliderNotifier.value = nVal,
                        onChangeEnd: (nVal) => videoPlayerController.seekTo(
                          Duration(
                            seconds: nVal.toInt(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      "${min.toString().padLeft(2, "0")}:${sec.toString().padRight(2, "0")}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          ValueListenableBuilder(
            valueListenable: volumeNotifier,
            builder: (context, volumeNotifierValue, child) {
              return InkWell(
                onTap: () {
                  if (volumeNotifierValue <= 0) {
                    volumeNotifier.value = 100;
                    videoPlayerController.setVolume(100);
                  } else {
                    volumeNotifier.value = 0;
                    videoPlayerController.setVolume(0);
                  }
                },
                child: volumeNotifierValue <= 0
                    ? SvgPicture.asset(
                        AppIcons.icVolumeMute,
                        height: 30,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 30,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
