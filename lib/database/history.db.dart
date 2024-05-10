// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:skru/models/history.model.dart';

class HistoryDB {
  String dbName;

  HistoryDB({required this.dbName});

  Future<Database> openDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDir.path, dbName);

    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(History history) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("history");

    var keyID = store.add(db, {
      'id': history.id,
      'image': history.image,
      'title': history.title,
      'accuracy': history.accuracy,
      'createdAt': history.createdAt,
    });
    db.close();
    return keyID;
  }

  Future<List<History>> loadAllData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("history");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<History> historyList = <History>[];
    for (var record in snapshot) {
      historyList.add(History(
          id: record['id'].toString(),
          image: record['image'].toString(),
          title: record['title'].toString(),
          accuracy: double.parse(record['accuracy'].toString()),
          createdAt: record['createdAt'].toString()));
    }
    db.close();
    return historyList;
  }

  Future<void> deleteData(String id) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("history");
    var finder = Finder(filter: Filter.equals('id', id));
    var val = await store.delete(db, finder: finder);
    db.close();
  }
}
