// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:skru/database/history.db.dart';
import 'package:skru/models/history.model.dart';

class HistoryProvider with ChangeNotifier {
  List<History> histories = [];

  Future<List<History>> initHistory() async {
    var db = HistoryDB(dbName: 'history.db');
    histories = await db.loadAllData();
    notifyListeners();
    return histories;
  }

  void addHistory(History history) async {
    var db = HistoryDB(dbName: 'history.db');
    await db.insertData(history);
    notifyListeners();
  }

  void removeHistory(String id) async {
    var db = HistoryDB(dbName: 'history.db');
    await db.deleteData(id);
    histories = await db.loadAllData();
    notifyListeners();
  }

  Future<bool> checkIdHistory(String id) async {
    var db = HistoryDB(dbName: 'history.db');
    histories = await db.loadAllData();
    var data = histories.where((element) => element.id == id);
    if (data.isNotEmpty) {
      return true;
    }
    return false;
  }
}
