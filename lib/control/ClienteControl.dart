import 'package:SalesApp/adapter/DataBaseHelper.dart';
import 'package:SalesApp/model/ClienteModel.dart';
import 'package:sqflite/sqflite.dart';

class ClienteControl{
  String table = 'cliente';
  int ret = 0;

  //Método inserir cliente
  Future<int> insertCliente(ClienteModel obj) async {
    Database db = await DatabaseHelper.instance.database;

    var map = <String, dynamic>{
      //'_idCliente': obj.idCliente,
      'nomeCliente': obj.nomeCliente,
      'emailCliente': obj.emailCliente
    };

    //Caso tenha id no campo iremos fazer atualização, e carrego a informação no parâmetro
    if(obj.idCliente != 0)
    {
      map["_idCliente"]  =   obj.idCliente;
      print('passei por aqui');
    }

    //Verifico se é atualizar ou inserir.
    if (obj.idCliente == null || obj.idCliente == 0) {
      ret = await db.insert(table, map);
    } else {
      await db.update(table, map, where: "id = ?", whereArgs: [obj.idCliente]);
      ret = obj.idCliente;
    }
    return ret;
  }







  //Método inserir cliente antigo
  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row) async {
    //Database db = await instance.database;
    Database db = await DatabaseHelper.instance.database;

    return await db.insert(table, row);
  }







}