import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crossface/app/common/widgets/BottomNavigationBar.dart';
import 'package:crossface/app/common/widgets/CustomAppBar.dart';

import 'package:crossface/app/common/style/text_style.dart';
import 'package:crossface/app/common/routes/routes.dart';
import 'package:crossface/app/services/firebase_services.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // передаю в переменную данные про авторизованного пользователя
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: CustomAppBar(logoPath: 'assets/images/auth/Logo.png'),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child:  Column(
                children: [
                  const SizedBox(height: 50),
                  if (user!.photoURL != null)
                    CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.photoURL!)),
                  const SizedBox(height: 10),
                  Text(
                    "Имя: ${user.displayName ?? 'Не указано'}",
                    style: TextStyles.Title1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Email: ${user.email ?? 'Не указан'}",
                    style: TextStyles.Title2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Телефон: ${user.phoneNumber ?? 'Не указан'}",
                    style: TextStyles.Title2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Дата создания аккаунта: ${user.metadata.creationTime}",
                    style: TextStyles.Title4,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Дата последнего входа: ${user.metadata.lastSignInTime}",
                    style: TextStyles.Title4,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().signOut();
                  Get.offNamed(Routes.AUTH);
                },
                child: const Text('Выход')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
