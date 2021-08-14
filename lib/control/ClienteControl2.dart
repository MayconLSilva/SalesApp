import 'package:SalesApp/adapter/DataBaseHelper.dart';
import 'package:SalesApp/model/ClienteModel.dart';
import 'package:sqflite/sqflite.dart';

class ClienteControl2{
  // var dbHelper = DatabaseHelper();
  String tabela = 'cliente';
  int ret = 0;

  Future<int> inserir(ClienteModel obj) async {
    //Database db = await dbHelper.initializeDatabase();
    Database db = await openDatabase("null");

    var map = <String, dynamic>{
      'idCliente': obj.idCliente,
      'nomeCliente': obj.nomeCliente,
      'emailCliente': obj.emailCliente,
      //'data_cadastro': ob.dataCadastro,
    };

    if (obj.idCliente == null || obj.idCliente == 0) {
      ret = await db.insert(tabela, map);
    } else {
      await db.update(tabela, map, where: "id = ?", whereArgs: [obj.idCliente]);
      ret = obj.idCliente;
    }

    return ret;
  }

  // late Database _database;
  // final String _tableCliente = "cliente";
  //
  // Future<int> salvar(ClienteModel objCliente) async {
  //   _validaCliente(objCliente);
  //   _database = await createDatabase();
  //   return _database.insert(_tableCliente, objCliente.getMap());
  // }
  //
  //
  //
  // _validaCliente(ClienteModel clienteModel) {
  //   if (clienteModel.nomeCliente == null ||
  //       clienteModel.nomeCliente == "" ||
  //       clienteModel.cpfCliente == "") {
  //     throw Exception("Dados inválidos!");
  //   }
  // }




}