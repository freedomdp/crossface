import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:crossface/app/common/routes/routes.dart';
import 'package:crossface/app/common/routes/pages.dart';
import 'package:crossface/app/common/style/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CrossFace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.AUTH,  //  передачи списка маршрутов при инициализации приложения
      getPages: AppPages.routes,
    );
  }
}