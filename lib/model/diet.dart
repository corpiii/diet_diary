import 'package:realm/realm.dart';

part 'diet.g.dart';

@RealmModel()
class _Diet {
  @PrimaryKey()
  late final Uuid uuid;

  late final String title;
  late final String imageBase64;
  late final String body;
}