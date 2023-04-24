import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossface/app/common/style/text_style.dart';
import 'package:crossface/app/common/widgets/BottomNavigationBar.dart';
import 'package:crossface/app/common/widgets/CustomAppBar.dart';
import 'package:crossface/app/logic/models/person.dart';
import 'package:crossface/app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../logic/cross_face_main_function.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int time = 0;
  bool status = true;

  initSearch() async {
    await CrossFaceFunctions.instance.findCrossFace();

    Timer.periodic(Duration(seconds: 30), (timer) async {
      if (!status) {
        timer.cancel();
        return;
      }
      await CrossFaceFunctions.instance.findCrossFace();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
              child: FutureBuilder(
                future: CrossFaceFunctions.instance.getCurrentPosition(),
                builder: (context, AsyncSnapshot<Position> snapshot) =>
                    snapshot.hasData
                        ? GestureDetector(
                            onTap: () async {
                              final String data =
                                  '${snapshot.data!.latitude},${snapshot.data!.longitude}';
                              Clipboard.setData(ClipboardData(text: data));
                            },
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: Icon(
                                  Icons.touch_app_outlined,
                                  size: 40,
                                  color: Colors.black.withOpacity(0.1),
                                )),
                                Positioned.fill(
                                    top: 20,
                                    child: Column(
                                      children: [
                                        Text(
                                          'My current position: ${snapshot.data!.latitude}, ${snapshot.data!.longitude}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          )
                        : Text('...'),
              ),
            ),
            const Text(
              'Интересные люди, с которыми вы пересекались сегодня',
              style: TextStyles.BodyMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: StreamBuilder<DocumentSnapshot<UserModel>>(
              stream: FirebaseServices.instance.userCrossFaces(),
              builder:
                  (context, AsyncSnapshot<DocumentSnapshot<UserModel>> snap) {
                if (snap.hasData) {
                  final crossFaces = snap.data!.data()!.crossFaces;
                  if (crossFaces.isNotEmpty &&
                      crossFaces[0].keys.any((element) => element == 'user')) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                maxCrossAxisExtent: 200),
                        itemCount: crossFaces.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.blue,
                            width: 100,
                            height: 100,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    crossFaces[index]['user']['email'] ??
                                        'Email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        final String data =
                                            '${crossFaces[index]['user']['latLng']['lat']}, ${crossFaces[index]['user']['latLng']['lng']}';
                                        Clipboard.setData(
                                            ClipboardData(text: data));
                                      },
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                              child: Icon(
                                            Icons.touch_app_outlined,
                                            size: 80,
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          )),
                                          Positioned.fill(
                                              top: 20,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Latitude: ${crossFaces[index]['user']['latLng']['lat']}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    'Longitude: ${crossFaces[index]['user']['latLng']['lng']}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    )),
                                Text(
                                  'Distance (meters): ${crossFaces[index]['distance']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        });
                  } else
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
            Column(
              children: [
                if (status && time == 0)
                  const Center(
                    child: Text('Starting search'),
                  ),
                if (status && time != 0)
                  Text(time.minutes.toString().substring(0, 4)),
                // InkWell(
                //   onTap: () async {
                //     setState(() {
                //       status = !status;
                //     });
                //
                //   },
                //   child: Container(
                //     width: MediaQuery.of(context).size.width * 0.8,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: !status ? Colors.blue : Colors.red,
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Turn ${!status ? 'ON' : 'OFF'} search',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
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
