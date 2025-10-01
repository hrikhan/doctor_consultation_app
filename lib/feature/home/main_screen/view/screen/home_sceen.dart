import 'package:doctor_consultation/feature/home/main_screen/controller/video_controller.dart';
import 'package:doctor_consultation/feature/home/video_details/view/video_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final VideoController controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Obx(() {
        return Column(
          children: [
            SizedBox(
              height: 200,
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.videos.length,
                itemBuilder: (context, index) {
                  final video = controller.videos[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => VideoDetailScreen(initialIndex: index));
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[900],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              video.thumbnailUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,

                            child: Icon(
                              Icons.play_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
