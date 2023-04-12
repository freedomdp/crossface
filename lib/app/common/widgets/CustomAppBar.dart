import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;

  CustomAppBar({required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        width: 109,
        height: 18,
        //child: SvgPicture.asset(logoPath),
        child: Image.asset(logoPath),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44);
}

Widget customAppBar(String logoPath) {
  return CustomAppBar(logoPath: logoPath);
}