import 'package:crossface/app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crossface/app/services/firebase_services.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';


import 'package:crossface/app/common/style/colors.dart';
import 'package:crossface/app/common/style/text_style.dart';
import 'package:crossface/app/common/style/botton_styles.dart';

import 'package:crossface/app/common/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.authBackground,
          image: DecorationImage(
            image: AssetImage('assets/images/auth/auth_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
                top: 120,
                child: Row(
                  children: [
                    Text(
                      "В городе ",
                      style: TextStyles.label_auth_top,
                    ),
                    Text(
                      "Киеве ",
                      style: TextStyles.label_auth_top_highlited,
                    ),
                    Text(
                      "онлайн ",
                      style: TextStyles.label_auth_top,
                    ),
                    Text(
                      "12 652 ",
                      style: TextStyles.label_auth_top_highlited,
                    ),
                    Text(
                      "пользователей ",
                      style: TextStyles.label_auth_top,
                    ),
                  ],
                )),
            Positioned(
                top: 280,
                child: Center(
                    child: Image.asset(
                  'assets/images/auth/Logo.png',
                  //child: SvgPicture.network(
                  //'https://firebasestorage.googleapis.com/v0/b/crossface-70cd2.appspot.com/o/Auth%2FLogo.svg?alt=media&token=4e26659c-0d96-4f26-8ae2-5b5c4e9221cd',
                  width: 290,
                  height: 60,
                ))),
            Positioned(
                top: 430,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    style: ButtonStyles.btnStyle_auth(),
                    onPressed: () async {
                      await FirebaseServices().signInWithGoogle();
                      Get.offNamed(Routes.USER_PROFILE);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/auth/logo_google.png',
                            width: 23,
                            height: 23,
                          ),
                          const SizedBox(width: 24),
                          const Text('Войти с помощью Google'),
                        ],
                      ),
                    ),
                  ),
                )),
            const Positioned(
                top: 650,
                left: 60,
                right: 60,
                child: Text(
                  "Здесь встречаются реальные люди с реальными людьми",
                  style: TextStyles.label_auth_bottom,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
