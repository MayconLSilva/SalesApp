import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "SalesAPP.db";
  static final _databaseVersion = 1;

  //Ref. tabela cliente
  static final table = 'cliente';
  static final columnId = '_idCliente';
  static final columnNome = 'nomeCliente';
  static final columncpfCnpj = 'CnpjCpfCliente';
  static final columninscricaoRg = 'IeRgCliente';
  static final columnEmail = 'emailCliente';
  static final columnTelefone = 'telefoneCliente';
  static final columnCelular = 'celularCliente';

  // Torna esta classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // tem somente uma referência ao banco de dados
  // static Database? _database;
  // Future<Database> get database async {
  //   if (_database != null)
  //     return _database;
  //   // instancia o db na primeira vez que for acessado
  //   _database  = await _initDatabase();
  //   return _database;
  // }

  // Tem somente uma referência ao banco de dados
  static Database? _database;
  Future <Database> get database async {
    if (_database != null){
      return _database!;
    }
    // Instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database!;
  }

  // Abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e as tabelas
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNome TEXT NOT NULL,
            $columncpfCnpj TEXT NOT NULL,
            $columninscricaoRg TEXT NOT NULL,
            $columnEmail INTEGER NOT NULL,
            $columnTelefone TEXT NOT NULL,
            $columnCelular TEXT NOT NULL
          )
          ''');
  }



}