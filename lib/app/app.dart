import 'package:crossface/app/common/routes/pages.dart';
import 'package:crossface/app/common/routes/routes.dart';
import 'package:crossface/app/common/style/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CrossFace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? Routes.SEARCH
          : Routes
              .AUTH, //  передачи списка маршрутов при инициализации приложения
      getPages: AppPages.routes,
    );
  }
}
