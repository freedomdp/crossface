import 'package:realm/realm.dart';

part 'realm_user_data.g.dart';

@RealmModel()
class _UserRealm {
  @PrimaryKey()
  late ObjectId id;

  late String email;

  late String name;
  late double time;
  late List<String> crossFaces;
}
