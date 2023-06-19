import 'package:crossface/app/logic/models/test/realm_user_data.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:realm/realm.dart';

import 'models/person.dart';

class CrossFaceAPI {
  CrossFaceAPI._();
  static final instance = CrossFaceAPI._();

  Dio dio = Dio();
  final String serverUrl = 'https://crossface.herokuapp.com/';

  Future<dynamic> getUserDataByEmail({required String email}) async {
    final Response req =
        await dio.get('${serverUrl}users/$email').then((value) => value);
    dynamic data = req.data;
    if (req.data != null) {
      return UserModel.fromJson(req.data);
    }
    return data;
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future createUserAfterLogin() async {
    try {
      if (await getUserDataByEmail(email: 'test_mail') == null) {
        final currentPosition = await getCurrentPosition();
        await dio
            .post('${serverUrl}users/create',
                data: UserModel(
                  email: 'test_mail',
                  //todo: change to real email in firebase services
                  name: 'Test',
                  latLng: {
                    "lat": currentPosition.latitude,
                    "lng": currentPosition.longitude
                  },
                  time: DateTime.now().millisecondsSinceEpoch,
                  crossFaces: [],
                ).toJson())
            .then((value) => print('user created'));
      } else {
        print('user exists');
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateCurrentUserData(
      {required String email,
      String? name,
      Map<String, dynamic>? latLng,
      List<dynamic>? crossFaces}) async {
    final UserModel currentData = await getUserDataByEmail(email: email);
    final Position position = await getCurrentPosition();
    try {
      await dio.put('${serverUrl}users/$email',
          data: UserModel(
            email: email,
            latLng: {"lat": position.latitude, "lng": position.longitude},
            crossFaces: crossFaces ?? currentData.crossFaces,
            name: name ?? currentData.name,
          ).toJson());
    } catch (e) {
      print(e);
    }
  }

  Stream<RealmObjectChanges> userDataStream({required String email}) async* {
    final config = Configuration.local([UserRealm.schema]);
    final realm = Realm(config);
    final ObjectId id = ObjectId.fromHexString('6472206fb384e394b05d5107');
    final data = realm.find(id);
    print(data!);
  }
}
