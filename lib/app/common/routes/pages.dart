import 'package:get/get.dart';
import 'package:crossface/app/pages/auth/login_page.dart';
import 'package:crossface/app/pages/application/search/search_page.dart';
import 'package:crossface/app/pages/application/notifications/notifications_page.dart';
import 'package:crossface/app/pages/application/favorite/favorite_page.dart';
import 'package:crossface/app/pages/application/chat/chat_page.dart';
import 'package:crossface/app/pages/application/profile/user_profile_page.dart';

import 'package:crossface/app/common/routes/routes.dart';


// В файле pages.dart мы импортируем все экраны нашего приложения и определяем маршруты для них с использованием класса GetPage. Затем объявляем список routes, который содержит все маршруты.

class AppPages {
  static final routes = [
    GetPage(name: Routes.AUTH, page: () => const LoginPage()),
    GetPage(name: Routes.SEARCH, page: () => const SearchPage()),
    GetPage(name: Routes.NOTIFICATIONS, page: () => const NotificationsPage()),
    GetPage(name: Routes.FAVORITE, page: () => const FavoritePage()),
    GetPage(name: Routes.CHAT, page: () => const ChatPage()),
    GetPage(name: Routes.USER_PROFILE, page: () =>  UserProfilePage()),
  ];
}