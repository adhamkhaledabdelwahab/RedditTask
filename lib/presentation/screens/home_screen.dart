// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:reddit_task/presentation/views/home/add_comment_view.dart';
import 'package:reddit_task/presentation/views/home/appbar_view.dart';
import 'package:reddit_task/presentation/views/home/comment_more_option_view.dart';
import 'package:reddit_task/presentation/views/home/comment_view_item.dart';
import 'package:reddit_task/presentation/views/home/comments_view.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final VideoPlayerController _videoPlayerController;
  late ValueNotifier<double> _sliderNotifier;
  late ValueNotifier<double> _volumeNotifier;
  late ValueNotifier<bool> _isPlayingNotifier;
  late ValueNotifier<bool> _isLikedNotifier;
  late ValueNotifier<bool> _isExpandedNotifier;
  late ValueNotifier<bool> _isFullExpandedNotifier;
  final _scrollController = ScrollController();

  var videoUrl = Uri.parse(
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  );

  @override
  void initState() {
    super.initState();
    _sliderNotifier = ValueNotifier(0);
    _volumeNotifier = ValueNotifier(100);
    _isPlayingNotifier = ValueNotifier(false);
    _isLikedNotifier = ValueNotifier(false);
    _isExpandedNotifier = ValueNotifier(true);
    _isFullExpandedNotifier = ValueNotifier(false);
    _videoPlayerController = VideoPlayerController.networkUrl(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _videoPlayerController.setVolume(_volumeNotifier.value);
    _videoPlayerController.addListener(() async {
      _sliderNotifier.value =
          (await _videoPlayerController.position)!.inSeconds.toDouble();
      _isPlayingNotifier.value = _videoPlayerController.value.isPlaying;
    });
    _scrollController.addListener(() {
      if (_scrollController.offset > 320 && _isExpandedNotifier.value) {
        _isExpandedNotifier.value = false;
      } else if (_scrollController.offset < 300 && !_isExpandedNotifier.value) {
        _isExpandedNotifier.value = true;
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: AddCommentView(
        isFullExpandedNotifier: _isFullExpandedNotifier,
        isExpandedNotifier: _isExpandedNotifier,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            AppBarView(
              isExpandedNotifier: _isExpandedNotifier,
              isFullExpandedNotifier: _isFullExpandedNotifier,
              isPlayingNotifier: _isPlayingNotifier,
              sliderNotifier: _sliderNotifier,
              volumeNotifier: _volumeNotifier,
              videoPlayerController: _videoPlayerController,
              isLikedNotifier: _isLikedNotifier,
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(64),
                        topRight: Radius.circular(64),
                      ),
                      color: Colors.grey.shade900,
                    ),
                    height: 30,
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CommentViewItem(
                    title: "Practical-Stay-9674",
                    timestamp: "Now",
                    body: "Heeloo",
                    onMoreClick: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (_) => const CommentMoreOptionView(),
                      );
                    },
                    onReplyClick: () {
                      //TODO
                    },
                  ),
                  CommentViewItem(
                    title: "Practical-Stay-9674",
                    timestamp: "3h",
                    subtitle:
                        "MOD 007S v2 SG | Cherry MX Black | GMX Shamshul++",
                    body: "Great build!",
                    onMoreClick: () {
                      //TODO
                    },
                    onReplyClick: () {
                      //TODO
                    },
                  ),
                  CommentsView(
                    comment: CommentViewItem(
                      separate: false,
                      title: "Practical-Stay-9674",
                      timestamp: "5h",
                      subtitle: "<3 all keyboards",
                      body:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      onMoreClick: () {
                        //TODO
                      },
                      onReplyClick: () {
                        //TODO
                      },
                    ),
                    comments: [
                      CommentsView(
                        comment: CommentViewItem(
                          title: "Practical-Stay-9674",
                          timestamp: "5h",
                          subtitle: "<3 all keyboards",
                          body:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          onMoreClick: () {
                            //TODO
                          },
                          onReplyClick: () {
                            //TODO
                          },
                        ),
                        comments: [
                          CommentViewItem(
                            title: "Practical-Stay-9674",
                            timestamp: "Now",
                            body: "Heeloo",
                            onMoreClick: () {
                              //TODO
                            },
                            onReplyClick: () {
                              //TODO
                            },
                          ),
                          CommentViewItem(
                            title: "Practical-Stay-9674",
                            timestamp: "3h",
                            subtitle:
                                "MOD 007S v2 SG | Cherry MX Black | GMX Shamshul++",
                            body: "Great build!",
                            onMoreClick: () {
                              //TODO
                            },
                            onReplyClick: () {
                              //TODO
                            },
                          ),
                          CommentViewItem(
                            title: "Practical-Stay-9674",
                            timestamp: "Now",
                            body: "Heeloo",
                            onMoreClick: () {
                              //TODO
                            },
                            onReplyClick: () {
                              //TODO
                            },
                          ),
                          CommentViewItem(
                            title: "Practical-Stay-9674",
                            timestamp: "3h",
                            subtitle:
                                "MOD 007S v2 SG | Cherry MX Black | GMX Shamshul++",
                            body: "Great build!",
                            onMoreClick: () {
                              //TODO
                            },
                            onReplyClick: () {
                              //TODO
                            },
                          ),
                        ],
                      ),
                      CommentViewItem(
                        title: "Practical-Stay-9674",
                        timestamp: "Now",
                        body: "Heeloo",
                        onMoreClick: () {
                          //TODO
                        },
                        onReplyClick: () {
                          //TODO
                        },
                      ),
                      CommentViewItem(
                        title: "Practical-Stay-9674",
                        timestamp: "3h",
                        subtitle:
                            "MOD 007S v2 SG | Cherry MX Black | GMX Shamshul++",
                        body: "Great build!",
                        onMoreClick: () {
                          //TODO
                        },
                        onReplyClick: () {
                          //TODO
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
