import 'package:flutter/material.dart';
import 'novoCliente.dart';

class Clientes extends StatelessWidget {
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
      body: Center(//Inicio do meio da tela, só jogar o listview

      ),
    );
  }
}

