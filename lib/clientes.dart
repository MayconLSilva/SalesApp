import 'package:SalesApp/adapter/DataBaseHelper.dart';
import 'package:SalesApp/control/ClienteControl.dart';
import 'package:flutter/material.dart';
import 'novoCliente.dart';

class Clientes extends StatelessWidget {

  final dbHelper = DatabaseHelper.instance;
  ClienteControl clienteControl = new ClienteControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add_alt_1_outlined),
            onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new NovoClienteDialog();
                    },
                    fullscreenDialog: true
                ));
              //_consultar();
            },
          ),
          //CAMPO BUSCA
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          //FINAL CAMPO BUSCA
        ],

      ),
      body: clientesDetail(),//Center(),
    );
  }

  clientesDetail(){
    return Container(padding: new EdgeInsets.all(5.0),
      child:
      ListTile(
        title: Text("user.email",
            style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text("teste"),
        leading: Icon(Icons.email,color: Colors.blue),
      ),
    );
  }

  void _consultar() async {
    //final todasLinhas = await dbHelper.queryAllRows();
    //final id = await clienteControl.insertCliente(clienteModel);
    final todasLinhas2 = await clienteControl.queryAllRows();
    print('Consulta todas as linhas:');
    todasLinhas2.forEach((row) => print(row));
  }


}

