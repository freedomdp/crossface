class CrossFaceFunctions {
  CrossFaceFunctions._();
  static final CrossFaceFunctions instance = CrossFaceFunctions._();

  // Future findCrossFace() async {
  //   final currentPosition = await getCurrentPosition();
  //   const Distance distance = Distance();
  //   final currentUser = FirebaseServices.instance.firebase
  //       .collection('test')
  //       .doc(FirebaseServices.instance.auth.currentUser!.email);
  //   final UserModel currentUserData = UserModel.fromJson((await FirebaseServices
  //               .instance.firebase
  //               .collection('test')
  //               .doc(FirebaseServices.instance.auth.currentUser!.email)
  //               .get())
  //           .data() ??
  //       UserModel.empty.toJson());
  //
  //   final DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(
  //       DateTime.now().toUtc().millisecondsSinceEpoch);
  //
  //   LatLng myCurrentCoords =
  //       LatLng(currentPosition.latitude, currentPosition.longitude);
  //
  //   await currentUser.set(UserModel(
  //           time: DateTime.now().toUtc().millisecondsSinceEpoch.toDouble(),
  //           email: FirebaseServices.instance.auth.currentUser!.email!,
  //           latLng: {
  //             "lat": currentPosition.latitude,
  //             "lng": currentPosition.longitude
  //           },
  //           name: FirebaseServices.instance.auth.currentUser!.displayName!,
  //           crossFaces: currentUserData.crossFaces)
  //       .toJson());
  //
  //   final data =
  //       await FirebaseServices.instance.firebase.collection('test').get();
  //   for (final item in data.docs.where((element) =>
  //       element.data()['email'] !=
  //       FirebaseServices.instance.auth.currentUser!.email)) {
  //     final user = UserModel.fromJson(item.data());
  //
  //     bool inRange = DateTime.fromMillisecondsSinceEpoch(user.time.toInt())
  //             .isBefore(DateTime(
  //                 currentDate.year,
  //                 currentDate.month,
  //                 currentDate.day,
  //                 currentDate.hour,
  //                 currentDate.minute,
  //                 currentDate.second + AppConstants.timeRange ~/ 2)) &&
  //         DateTime.fromMillisecondsSinceEpoch(user.time.toInt()).isAfter(
  //             DateTime(
  //                 currentDate.year,
  //                 currentDate.month,
  //                 currentDate.day,
  //                 currentDate.hour,
  //                 currentDate.minute,
  //                 currentDate.second - AppConstants.timeRange ~/ 2));
  //     if (distance(myCurrentCoords,
  //                 LatLng(user.latLng['lat'], user.latLng['lng'])) <
  //             AppConstants.radiusOfSearch &&
  //         inRange) {
  //       if (user.email == FirebaseServices.instance.auth.currentUser!.email!) {
  //         return;
  //       } else {
  //         if (currentUserData.crossFaces
  //             .where((element) => element['user']['email'] == user.email)
  //             .isNotEmpty) {
  //           return;
  //         } else {
  //           FirebaseServices.instance.firebase
  //               .collection('test')
  //               .doc(FirebaseServices.instance.auth.currentUser!.email!)
  //               .update({
  //             // ignore: prefer_collection_literals
  //             "crossFaces": [
  //               ...currentUserData.crossFaces,
  //               {
  //                 "distance": distance(myCurrentCoords,
  //                     LatLng(user.latLng['lat'], user.latLng['lng'])),
  //                 "user": {
  //                   "email": user.email,
  //                   "name": user.name,
  //                   "latLng": user.latLng
  //                 }
  //               }
  //             ].toSet().toList()
  //           });
  //         }
  //       }
  //     }
  //   }
  // }
}
