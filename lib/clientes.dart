import 'package:SalesApp/Util.dart';
import 'package:SalesApp/adapter/DataBaseHelper.dart';
import 'package:SalesApp/control/ClienteControl.dart';
import 'package:SalesApp/model/ClienteModel.dart';
import 'package:flutter/material.dart';
import 'novoCliente.dart';

class Clientes extends StatefulWidget {
  final dbHelper = DatabaseHelper.instance;
  ClienteControl clienteControl = new ClienteControl();

  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}

class _ListViewNoteState extends State {
  var contatos;
  var rp = ClienteControl();

  @override
  void initState() {
    super.initState();

    rp.listar().then((value) {
      setState(() {
        contatos = value;
      });
    });
  }

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
                    fullscreenDialog: true));
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                //Container(height: 30),
                Expanded(
                    child: RefreshIndicator(
                  child: new FutureBuilder(
                      future: rp.listar(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                          default:
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');
                            else
                              return ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return _listaContatos(context, index);
                                },
                                itemCount:
                                    contatos != null ? contatos.length : 0,
                              );
                        }
                      }),
                  onRefresh: _filtrar,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _listaContatos(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        //_detalhar(context, index);
      },
      child: Container(
          height: 100,
          child: Card(
              elevation: 1,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        // Container(
                        //   margin: EdgeInsets.only(left: 5, right: 5),
                        //   width: 35,
                        //   height: 35,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.grey[300],
                        //     //color: Color(Colors.lightBlue[200]
                        //   ),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: <Widget>[
                        //       Text(Util.intFormat(
                        //                   contatos[index]["_idCliente"].toString()) >
                        //               0
                        //           ? contatos[index]["nomeCliente"][0]
                        //                   .toString()
                        //                   .toUpperCase() +
                        //               contatos[index]["nomeCliente"][1]
                        //                   .toString()
                        //                   .toUpperCase()
                        //           : "".toUpperCase()),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  contatos[index]["_idCliente"]
                                              .toString()
                                              .toUpperCase() +
                                          " - " +
                                          contatos[index]["nomeCliente"]
                                              .toUpperCase() ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "Fone: " +
                                      contatos[index]["telefoneCliente"]
                                          .toUpperCase()
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "E-mail: " +
                                      contatos[index]["emailCliente"]
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "Data Inclusão: " +
                                      // Config.dataConvert( contatos[index]["data_cadastro"]
                                      //     .toString() )
                                      contatos[index]["CnpjCpfCliente"]
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }

  Future<Null> _filtrar() async {
    contatos = await rp.listar();

    setState(() {});

    return null;
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Clientes"),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.person_add_alt_1_outlined),
//           onPressed: () {
//               Navigator.of(context).push(new MaterialPageRoute<Null>(
//                   builder: (BuildContext context) {
//                     return new NovoClienteDialog();
//                   },
//                   fullscreenDialog: true
//               ));
//             //_consultar();
//           },
//         ),
//         //CAMPO BUSCA
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Icon(Icons.search),
//         ),
//         //FINAL CAMPO BUSCA
//       ],
//
//     ),
//     body: Center(),//istarClientes(),
//
//     //listClientes(),//clientesDetail(),//Center(),
//   );
// }
