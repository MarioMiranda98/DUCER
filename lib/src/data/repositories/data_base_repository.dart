import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ducer/src/utils/data_base_tables.dart';

class DataBaseRepository {
  static Database _dataBase;

  DataBaseRepository._internal();
  static DataBaseRepository get instance => _instance;
  static final DataBaseRepository _instance =  DataBaseRepository._internal();

  Future<Database> get database async {
    if(_dataBase != null) return _dataBase;

    _dataBase = await initDB();

    return _dataBase;
  }

  static Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Ducer.db');

    return await openDatabase(
      path, 
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(kRegisterUserTable);
        await db.execute(kRegisterChildTable);
        await db.execute(kRegisterIncidencesTable);
        await db.execute(kIncidencesTable);
        await db.execute(kTestsTable);
      }
    );
  }
}