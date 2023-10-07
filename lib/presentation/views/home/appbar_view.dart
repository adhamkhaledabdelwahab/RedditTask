import 'package:flutter/material.dart';
import 'package:reddit_task/presentation/views/home/appbar_title_view.dart';
import 'package:reddit_task/presentation/views/home/video_controlls_view.dart';
import 'package:reddit_task/presentation/views/home/video_details_view.dart';
import 'package:video_player/video_player.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
    required this.isExpandedNotifier,
    required this.isPlayingNotifier,
    required this.sliderNotifier,
    required this.volumeNotifier,
    required this.videoPlayerController,
    required this.isLikedNotifier,
    required this.isFullExpandedNotifier,
  });

  final ValueNotifier<bool> isExpandedNotifier;
  final ValueNotifier<bool> isFullExpandedNotifier;
  final ValueNotifier<bool> isPlayingNotifier;
  final ValueNotifier<double> sliderNotifier;
  final ValueNotifier<double> volumeNotifier;
  final VideoPlayerController videoPlayerController;
  final ValueNotifier<bool> isLikedNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isFullExpandedNotifier,
        builder: (context, isFullExpandedNotifierValue, child) {
          return ValueListenableBuilder(
            valueListenable: isExpandedNotifier,
            builder: (context, isExpandedNotifierValue, child) {
              return SliverAppBar(
                toolbarHeight: isExpandedNotifierValue ? kToolbarHeight : 0,
                key: const ValueKey(0),
                elevation: 0,
                backgroundColor: Colors.black,
                leading: isExpandedNotifierValue
                    ? InkWell(
                        onTap: () {
                          //TODO perform back navigation action
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    : null,
                centerTitle: true,
                actions: isExpandedNotifierValue
                    ? [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 5,
                          ),
                          child: Material(
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // TODO preform additional actions from appbar
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    : null,
                title: isExpandedNotifierValue
                    ? const AppBarTitleView(
                        title: "r/MechanicalKeyboards",
                        image: Icon(
                          Icons.shopping_bag,
                          color: Colors.white70,
                          size: 20,
                        ),
                      )
                    : null,
                expandedHeight: MediaQuery.sizeOf(context).height * 0.97,
                pinned: true,
                bottom: isExpandedNotifierValue || isFullExpandedNotifierValue
                    ? null
                    : PreferredSize(
                        preferredSize: Size(
                          double.infinity,
                          MediaQuery.sizeOf(context).height * 0.37,
                        ),
                        child: AspectRatio(
                          aspectRatio: 5 / 3,
                          child: VideoPlayer(
                            videoPlayerController,
                          ),
                        ),
                      ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AspectRatio(
                        aspectRatio: 5 / 3,
                        child: VideoPlayer(
                          videoPlayerController,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      VideoDetailsView(
                        isLikedNotifier: isLikedNotifier,
                      ),
                      VideoControlsView(
                        isPlayingNotifier: isPlayingNotifier,
                        sliderNotifier: sliderNotifier,
                        volumeNotifier: volumeNotifier,
                        videoPlayerController: videoPlayerController,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
