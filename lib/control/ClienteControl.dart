import 'package:SalesApp/adapter/DataBaseHelper.dart';
import 'package:SalesApp/model/ClienteModel.dart';
import 'package:sqflite/sqflite.dart';

class ClienteControl{
  String table = 'cliente';

  // métodos Helper
  //----------------------------------------------------
  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row) async {
    //Database db = await instance.database;
    Database db = await DatabaseHelper.instance.database;

    return await db.insert(table, row);
  }





}