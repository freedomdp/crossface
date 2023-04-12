import 'package:crossface/app/common/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:crossface/app/common/style/colors.dart';

class ButtonStyles {
  static ButtonStyle btnStyle_auth() {
    return ElevatedButton.styleFrom(
      primary: AppColors.cardBackground,
      onPrimary: AppColors.colorPrimaryText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textStyle: TextStyles.text_btn_auth,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
    );
  }
}

class NavBarItemStyles {
  static const backgroundColor = AppColors.colorsScaffoldBackground;
  static const selectedItemColor = AppColors.colorPrimary;
  static const unselectedItemColor = AppColors.iconsMenuBackground;
  static const selectedFontSize = 0.0;
  static const unselectedFontSize = 0.0;
  static const navBarItemType = BottomNavigationBarType.fixed;
}

