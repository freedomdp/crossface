import 'dart:async';

import 'package:crossface/app/common/widgets/BottomNavigationBar.dart';
import 'package:crossface/app/common/widgets/CustomAppBar.dart';
import 'package:crossface/app/logic/backend_services.dart';
import 'package:crossface/app/logic/index.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int time = 0;
  bool status = true;

  initSearch() async {
    await CrossFaceAPI.instance.getUserDataByEmail(email: 'test_mail');

    Timer.periodic(Duration(seconds: 30), (timer) async {
      if (!status) {
        timer.cancel();
        return;
      }
      await CrossFaceAPI.instance.getUserDataByEmail(email: 'test_mail');
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!status) {
        timer.cancel();
        setState(() {
          time = 0;
        });
        return;
      }
      setState(() {
        time = timer.tick;
      });
    });
  }

  @override
  void initState() {
    initSearch();
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      status = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(logoPath: 'assets/images/auth/Logo.png'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
            future:
                CrossFaceAPI.instance.getUserDataByEmail(email: 'test_mail'),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData && snapshot.data is UserModel) {
                final user = snapshot.data as UserModel;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: user.crossFaces!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      user.crossFaces![index].toString(),
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      //const Center(child: Text('Интересные люди, с которыми вы пересекались сегодня'),     ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class CrossFaceModel {
  final String? email;
  final String? name;
  final Map<String, dynamic>? latLng;

  CrossFaceModel(this.email, this.name, this.latLng);
}
