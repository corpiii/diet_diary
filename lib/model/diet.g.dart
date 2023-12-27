// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Diet extends _Diet with RealmEntity, RealmObjectBase, RealmObject {
  Diet(
    Uuid uuid,
    String title,
    String imageBase64,
    String body,
  ) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'imageBase64', imageBase64);
    RealmObjectBase.set(this, 'body', body);
  }

  Diet._();

  @override
  Uuid get uuid => RealmObjectBase.get<Uuid>(this, 'uuid') as Uuid;
  @override
  set uuid(Uuid value) => throw RealmUnsupportedSetError();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => throw RealmUnsupportedSetError();

  @override
  String get imageBase64 =>
      RealmObjectBase.get<String>(this, 'imageBase64') as String;
  @override
  set imageBase64(String value) => throw RealmUnsupportedSetError();

  @override
  String get body => RealmObjectBase.get<String>(this, 'body') as String;
  @override
  set body(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Diet>> get changes =>
      RealmObjectBase.getChanges<Diet>(this);

  @override
  Diet freeze() => RealmObjectBase.freezeObject<Diet>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Diet._);
    return const SchemaObject(ObjectType.realmObject, Diet, 'Diet', [
      SchemaProperty('uuid', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('imageBase64', RealmPropertyType.string),
      SchemaProperty('body', RealmPropertyType.string),
    ]);
  }
}
