import 'package:doctor_consultation/feature/home/main_screen/model/video_model.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  var videos = <VideoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyVideos();
  }

  void loadDummyVideos() {
    videos.value = [
      VideoModel(
        id: '1',
        title: 'Big Buck Bunny',
        thumbnailUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Big_Buck_Bunny_thumbnail_vlc.png/1200px-Big_Buck_Bunny_thumbnail_vlc.png',
        videoUrl:
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      ),
      // VideoModel(
      //   id: '2',
      //   title: 'For Bigger Blazes',
      //   thumbnailUrl: 'https://i.ytimg.com/vi/Dr9C2oswZfA/maxresdefault.jpg',
      //   videoUrl:
      //       'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      // ),
      VideoModel(
        id: '3',
        title: 'For Bigger Escape',
        thumbnailUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Big_Buck_Bunny_thumbnail_vlc.png/1200px-Big_Buck_Bunny_thumbnail_vlc.png',
        videoUrl:
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      ),
      VideoModel(
        id: '1',
        title: 'Big Buck Bunny',
        thumbnailUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Big_Buck_Bunny_thumbnail_vlc.png/1200px-Big_Buck_Bunny_thumbnail_vlc.png',
        videoUrl:
            'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      ),
    ];
  }
}
