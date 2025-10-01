import 'package:doctor_consultation/core/utils/app_colors.dart';
import 'package:doctor_consultation/feature/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:doctor_consultation/feature/home/main_screen/view/screen/home_sceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  final pages = [
    HomeScreen(),
    Center(child: Text("Favourite")),
    Center(child: Text("Cart")),
    Center(child: Text("Chat")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[navController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              IconData icon;
              switch (index) {
                case 0:
                  icon = Icons.home;
                  break;
                case 1:
                  icon = Icons.favorite;
                  break;
                case 2:
                  icon = Icons.shopping_cart;
                  break;
                default:
                  icon = Icons.chat;
              }

              final isSelected = navController.currentIndex.value == index;

              return InkResponse(
                onTap: () => navController.changePage(index),
                radius: 20, // 🔹 custom splash radius
                splashColor: AppColors.primary.withValues(alpha: 0.1),
                highlightColor: AppColors.primary.withValues(alpha: 0.1),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
