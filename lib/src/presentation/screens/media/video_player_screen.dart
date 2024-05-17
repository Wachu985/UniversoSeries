import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerScreen extends StatefulWidget {
  static const String screenName = "VideoPlayerScreen";
  final String videoUri;
  final String subtitleUri;
  const VideoPlayerScreen({
    super.key,
    required this.videoUri,
    required this.subtitleUri,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);
  @override
  void initState() {
    player.open(Media(widget.videoUri));
    player.setSubtitleTrack(SubtitleTrack.uri(widget.subtitleUri,
        language: "Spanish", title: "es"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                width: size.width,
                height: size.height,
                // Use [Video] widget to display video output.
                child: Video(controller: controller),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() async {
    await player.dispose();
    super.dispose();
  }
}
