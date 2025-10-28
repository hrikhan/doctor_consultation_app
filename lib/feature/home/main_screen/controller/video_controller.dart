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
        title: 'Health Tips for You',
        thumbnailUrl:
            'https://thumbs.dreamstime.com/b/close-up-male-doctor-holding-sign-text-health-tips-close-up-male-doctor-gloves-holding-sign-199016028.jpg',
        videoUrl:
            'https://res.cloudinary.com/dofsibxao/video/upload/v1759308575/samples/dance-2.mp4',
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
            "https://img.freepik.com/free-photo/young-female-doctor-wearing-medical-robe-mask-stethoscope-stretching-yes-note-isolated-green-wall-with-copy-space_141793-79427.jpg?semt=ais_hybrid&w=740&q=80",
        videoUrl:
            'https://player.cloudinary.com/embed/?cloud_name=dofsibxao&public_id=samples%2Felephants&profile=cld-default',
      ),
      VideoModel(
        id: '1',
        title: 'Big Buck Bunny',
        thumbnailUrl:
            'https://www.adsc.com/hs-fs/hubfs/shutterstock_156431549.jpg?width=250&name=shutterstock_156431549.jpg',
        videoUrl:
            'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      ),
    ];
  }
}
