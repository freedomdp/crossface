import 'package:flutter/material.dart';
import 'package:crossface/app/common/widgets/BottomNavigationBar.dart';
import 'package:crossface/app/common/widgets/CustomAppBar.dart';


class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(logoPath: 'assets/images/auth/Logo.png'),
      body: const Center(
        child: Text('Страница уведомлений'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}