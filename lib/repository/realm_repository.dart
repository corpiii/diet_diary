import 'package:realm/realm.dart';

import '../model/diet.dart';

class RealmRepository {
  List<Diet> _models = [];
  List<Diet> get model => _models;

  late final Realm _realm;

  static RealmRepository get instance => _instance;
  static final _instance = RealmRepository._();

  RealmRepository._() {
    final config = Configuration.local([Diet.schema]);
    _realm = Realm(config);

    _models = _realm.all<Diet>().toList();
  }

  Future<void> save(List<Diet> models) async {
    _models = models;

    _realm.write(() {
      _realm.addAll(models, update: true);
    });
  }

  Future<void> delete(Diet model) async {
    _models = _models.where((element) => element.uuid != model.uuid).toList();

    _realm.write(() {
      _realm.delete(model);
    });
  }
}