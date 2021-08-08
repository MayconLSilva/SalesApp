import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> DataBaseHelpe() async {
  final String path = await getDatabasesPath();
  final String nomeDb = "Sales.db";

  return openDatabase(join(path, nomeDb), onCreate: (db, version) {
    return db.execute(
        "CREATE TABLE cliente(idCliente INTEGER PRIMARY KEY, nomeCliente TEXT, emailCliente TEXT  )");
  }, version: 1);
}