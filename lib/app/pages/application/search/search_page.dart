import 'package:flutter/material.dart';
import 'package:crossface/app/common/style/text_style.dart';
import 'package:crossface/app/common/widgets/BottomNavigationBar.dart';
import 'package:crossface/app/common/widgets/CustomAppBar.dart';



class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(logoPath: 'assets/images/auth/Logo.png'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const Column(
                children: [
                  Text(
                    'Интересные люди, с которыми вы пересекались сегодня',
                    style: TextStyles.BodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //const Center(child: Text('Интересные люди, с которыми вы пересекались сегодня'),     ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
