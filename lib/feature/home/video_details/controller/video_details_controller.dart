import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:doctor_consultation/feature/home/main_screen/controller/video_controller.dart';

class VideoDetailController extends GetxController {
  final VideoController videoController = Get.find();

  var currentIndex = 0.obs;
  late PageController pageController;

  // Map to hold VideoPlayerControllers for each index
  final Map<int, VideoPlayerController> videoPlayers = {};

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    _initializeVideo(currentIndex.value);
  }

  Future<void> _initializeVideo(int index) async {
    // Dispose old controller if exists
    if (videoPlayers[index] != null) {
      await videoPlayers[index]?.dispose();
    }

    final controller = VideoPlayerController.network(
      videoController.videos[index].videoUrl,
    );

    videoPlayers[index] = controller;
    await controller.initialize();
    controller.setLooping(true);
    controller.play();
    controller.setVolume(10.0);

    update(); // notify GetX observers
  }

  void onPageChanged(int index) {
    currentIndex.value = index;

    // Initialize the video for the new page if not already
    if (videoPlayers[index] == null) {
      _initializeVideo(index);
    } else {
      videoPlayers[index]?.play();
    }

    // Pause previous videos
    videoPlayers.forEach((key, controller) {
      if (key != index) controller.pause();
    });
  }

  @override
  void onClose() {
    videoPlayers.forEach((key, controller) => controller.dispose());
    pageController.dispose();
    super.onClose();
  }
}
