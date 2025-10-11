import 'package:doctor_consultation/feature/home/main_screen/model/doctor_list_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var allDoctors = <Doctor>[].obs;
  var featuredDoctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctors();
    loadFeaturedDoctors();
  }

  void loadDoctors() {
    allDoctors.value = [
      Doctor(
        name: "Dr. Sarah Ahmed",
        specialty: "Cardiologist",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvV2ZApDSUQbhQhUpTmOWwy4pgRnTkm_UiIA&s",
        rating: 4.8,
      ),
      Doctor(
        name: "Dr. Elin Rahman",
        specialty: "Dermatologist",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS5Ub-r2wrDnint_u-2HMQ9wQeLVPKoy9glg&s",
        rating: 4.5,
      ),
      Doctor(
        name: "Dr. Laila",
        specialty: "Neurologist",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuxn18sETYg1Ob6cxFeQmyoGcwHzfEFt2YQ&s",
        rating: 4.7,
      ),
      Doctor(
        name: "Dr. Rakib Hasan",
        specialty: "Pediatrician",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzMnqgs3U7KpmaQUo-qSbPEYV_rmz-_dtCoQ&s",
        rating: 4.6,
      ),
    ];
  }

  void loadFeaturedDoctors() {
    featuredDoctors.value = [
      Doctor(
        name: "Dr. Sarah Ahmed",
        specialty: "Cardiologist",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvV2ZApDSUQbhQhUpTmOWwy4pgRnTkm_UiIA&s",
        rating: 4.8,
      ),
      Doctor(
        name: "Dr. Laila",
        specialty: "Neurologist",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuxn18sETYg1Ob6cxFeQmyoGcwHzfEFt2YQ&s",
        rating: 4.7,
      ),
      Doctor(
        name: "Dr. Rakib Hasan",
        specialty: "Pediatrician",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzMnqgs3U7KpmaQUo-qSbPEYV_rmz-_dtCoQ&s",
        rating: 4.6,
      ),
      Doctor(
        name: "Dr. Laila",
        specialty: "Neurologist",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuxn18sETYg1Ob6cxFeQmyoGcwHzfEFt2YQ&s",
        rating: 4.7,
      ),
    ];
  }
}
