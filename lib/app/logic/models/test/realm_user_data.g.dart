// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_user_data.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UserRealm extends _UserRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  UserRealm(
    ObjectId id,
    String email,
    String name,
    double time, {
    Iterable<String> crossFaces = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set<RealmList<String>>(
        this, 'crossFaces', RealmList<String>(crossFaces));
  }

  UserRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get time => RealmObjectBase.get<double>(this, 'time') as double;
  @override
  set time(double value) => RealmObjectBase.set(this, 'time', value);

  @override
  RealmList<String> get crossFaces =>
      RealmObjectBase.get<String>(this, 'crossFaces') as RealmList<String>;
  @override
  set crossFaces(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<UserRealm>> get changes =>
      RealmObjectBase.getChanges<UserRealm>(this);

  @override
  UserRealm freeze() => RealmObjectBase.freezeObject<UserRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserRealm._);
    return const SchemaObject(ObjectType.realmObject, UserRealm, 'UserRealm', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('time', RealmPropertyType.double),
      SchemaProperty('crossFaces', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
