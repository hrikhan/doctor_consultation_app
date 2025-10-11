import 'package:doctor_consultation/core/common/style/textstyle.dart';
import 'package:doctor_consultation/core/common/widgets/appbar.dart';
import 'package:doctor_consultation/core/utils/app_colors.dart';
import 'package:doctor_consultation/feature/home/main_screen/controller/home_screen_controller.dart';
import 'package:doctor_consultation/feature/home/main_screen/controller/video_controller.dart';
import 'package:doctor_consultation/feature/home/main_screen/view/widgets/animated_fab.dart';
import 'package:doctor_consultation/feature/home/main_screen/view/widgets/video_infocard.dart';
import 'package:doctor_consultation/feature/home/video_details/view/video_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final VideoController controller = Get.put(VideoController());
  final HomeScreenController homeScreenController = Get.put(
    HomeScreenController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithSearch(
        title: 'Welcome,Hridoy',
        subtitle: "Care Yourself Daily",
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🎥 Video List
                Text(
                  "Health Tips",
                  style: GetTextStyle.heading(fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                Container(
                  color: Colors.white,
                  height: 200.h,
                  width: Get.width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
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
                          margin: const EdgeInsets.only(right: 10),
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
                              const Align(
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
                20.verticalSpace,
                Text(
                  "Top Doctors",
                  style: GetTextStyle.heading(fontWeight: FontWeight.w600),
                ),
                Obx(() {
                  return SizedBox(
                    height: 260.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenController.allDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = homeScreenController.allDoctors[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 10),
                          child: DoctorInfoCard(
                            title: doctor.name,
                            subtitle: doctor.specialty,
                            imageUrl: doctor.imageUrl,
                            onTap: () {
                              // handle tap (e.g., go to details)
                              Get.snackbar(
                                "Doctor Selected",
                                doctor.name,
                                backgroundColor: AppColors.primary,
                                colorText: Colors.white,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }),
                Text(
                  "For You",
                  style: GetTextStyle.heading(fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeScreenController.featuredDoctors.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,

                        mainAxisExtent: 250.w, // adjust height/width ratio
                      ),
                      itemBuilder: (context, index) {
                        final doctor =
                            homeScreenController.featuredDoctors[index];
                        return DoctorInfoCard(
                          title: doctor.name,
                          subtitle: doctor.specialty,
                          imageUrl: doctor.imageUrl,
                          onTap: () {
                            Get.snackbar(
                              "Doctor Selected",
                              doctor.name,
                              backgroundColor: AppColors.primary,
                              colorText: Colors.white,
                            );
                          },
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: AnimatedFAB(onTap: () {}),
    );
  }
}
