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
      'nomeCliente': obj.nomeCliente,
      'CnpjCpfCliente' : obj.cpfCliente,
      'IeRgCliente' : obj.rgIeCliente,
      'emailCliente': obj.emailCliente,
      'telefoneCliente': obj.telefoneCliente,
      'celularCliente': obj.celularCliente
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

  //Listar clientes






  Future getAllNotes() async {
    //var dbClient = await db;
    Database db = await DatabaseHelper.instance.database;


    var result = await db.query(table, columns: ["_idCliente", "nomeCliente", "CnpjCpfCliente"]);
    //    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }


  // Future<List<ClienteModel>> ler() async {
  //   print('Inicio Controle' );
  //   Database db = await DatabaseHelper.instance.database;
  //   print('Inicio Controle 2' );
  //
  //
  //   ClienteModel clienteModel = new ClienteModel();
  //   print('Inicio Controle 3' );
  //   //List<ClienteModel> listarClientes = new List();
  //
  //
  //
  //
  //   print('Inicio Controle 4' );
  //
  //   List<Map<String, dynamic>> mapContatos = await db.query(table, orderBy: "nomeCliente ASC");
  //
  //   print('Inicio Controle 5 ' );
  //
  //
  //   for (Map<String, dynamic> map in mapContatos) {
  //     print('Inicio Controle 6 ' );
  //     ClienteModel objCliente = new ClienteModel();
  //     print('Inicio Controle 7 ' );
  //         objCliente.nomeCliente =  map['nomeCliente'];
  //         objCliente.cpfCliente = map['CnpjCpfCliente'];
  //     print('Inicio Controle 8 ' );
  //     print('Inicio Controle 8B ' + map['nomeCliente']);
  //     print('Inicio Controle 8c ' + map['CnpjCpfCliente']);
  //
  //
  //     //listarClientes.add(objCliente);
  //     print('Inicio Controle 9 ' );
  //   }
  //
  //
  //   print('Final Controle' );
  //
  //   return listarClientes;
  // }


  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await DatabaseHelper.instance.database;

    return await db.query(table);
  }


  Future listar() async {
    try {
      Database db = await DatabaseHelper.instance.database;
      String sql = "SELECT * FROM " + table ;

      List map = await db.rawQuery(sql);

      return map;
    } catch (e) {}
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