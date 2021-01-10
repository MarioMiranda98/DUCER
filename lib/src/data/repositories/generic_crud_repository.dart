import 'package:ducer/src/data/repositories/data_base_repository.dart';
import 'package:ducer/src/models/response_data_base_model.dart';

class GenericCrudRepository {
  GenericCrudRepository._internal();

  static GenericCrudRepository get instance => _instance;

  static GenericCrudRepository _instance =  GenericCrudRepository._internal();

  Future<int> create({String tableName, Map<String, dynamic> body}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.insert(tableName, body);
    
    return res;
  }

  Future<ResponseDataBaseModel> readFor({String tableName, String where, List<dynamic> args}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.query(
      tableName,
      where: where,
      whereArgs: args
    );

    return ResponseDataBaseModel(
      data: res.isNotEmpty ? res : [],
      isEmpty: res.isNotEmpty ? false : true
    );
  }

  Future<ResponseDataBaseModel> readAll({String tableName}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.query(tableName);

    return ResponseDataBaseModel(
      data: res.isNotEmpty ? res : [],
      isEmpty: res.isNotEmpty ? false : true,
    );
  }

  Future<int> update({String tableName, Map<String, dynamic> body, String where, List<dynamic> args}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.update(
      tableName,
      body,
      where: where,
      whereArgs: args
    );

    return res;
  }

  Future<int> deleteOne({String tableName, String where, List<dynamic> args}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database; 
    final res = await dataBaseRepository.delete(
      tableName,
      where: where,
      whereArgs: args
    );

    return res;
  }

  Future<int> deleteAll({String tableName}) async {
    final dataBaseRepository = await DataBaseRepository.instance.database;
    final res = await dataBaseRepository.delete(tableName);

    return res;
  }
}