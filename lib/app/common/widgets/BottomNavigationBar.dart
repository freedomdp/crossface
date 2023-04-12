import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crossface/app/common/routes/routes.dart';
import 'package:crossface/app/common/style/botton_styles.dart';

class BottomNavBarController extends GetxController {
  final currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed(Routes.SEARCH);
        break;
      case 1:
        Get.toNamed(Routes.NOTIFICATIONS);
        break;
      case 2:
        Get.toNamed(Routes.FAVORITE);
        break;
      case 3:
        Get.toNamed(Routes.CHAT);
        break;
      case 4:
        Get.toNamed(Routes.USER_PROFILE);
        break;
    }
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavBarController());

    return Obx(() {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Уведомления'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Избранное'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чат'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Профиль'),
          ],
          backgroundColor: NavBarItemStyles.backgroundColor,
          selectedItemColor: NavBarItemStyles.selectedItemColor,
          unselectedItemColor: NavBarItemStyles.unselectedItemColor,
          selectedFontSize: NavBarItemStyles.selectedFontSize,
          unselectedFontSize: NavBarItemStyles.unselectedFontSize,
          type: NavBarItemStyles.navBarItemType,
        ),
      );
    });
  }
}
