import 'package:doctor_consultation/feature/home/video_details/controller/video_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoDetailScreen extends StatelessWidget {
  final int initialIndex;
  const VideoDetailScreen({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final VideoDetailController controller = Get.put(VideoDetailController());

    controller.currentIndex.value = initialIndex;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<VideoDetailController>(
        builder: (_) {
          return PageView.builder(
            controller: controller.pageController,
            scrollDirection: Axis.vertical,
            itemCount: controller.videoController.videos.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final videoPlayer = controller.videoPlayers[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  if (videoPlayer != null && videoPlayer.value.isInitialized)
                    FittedBox(
                      fit: BoxFit.fitWidth, // Makes video fill the screen
                      child: SizedBox(
                        width: videoPlayer.value.size.width,
                        height: videoPlayer.value.size.height,
                        child: VideoPlayer(videoPlayer),
                      ),
                    )
                  else
                    const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
