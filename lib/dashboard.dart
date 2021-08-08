
import 'package:flutter/material.dart';
import 'clientes.dart';
import 'package:SalesApp/theme/style.dart';

class DashboardPrincipal extends StatelessWidget {
  final appTitle = 'Dashboard';
  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);

    return MaterialApp(
      title: appTitle,
      theme:CustomAppTheme(),

      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),



      //INICIO DO CÓDIGO DO DRAWER
      drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,//epaço entre o drawer e o topo da tela
          children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Maycon Silva"),
            accountEmail: Text("mayconsilva_cp@icloud.com"),
            currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS? Colors.grey: Colors.white,
                  child: Text("M", style:
                  TextStyle(fontSize: 40.0),
                  ),
              ),
          ),

            ListTile(
              leading: Icon(Icons.supervisor_account),
              title: Text('Clientes'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //Método chama a outra tela
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Clientes()));
                //Fim do método chama outra tela

              },
            ),
            ListTile(
              leading: Icon(Icons.inventory_2_outlined),
              title: Text('Produtos'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => NovoClienteDialog()),
                // );
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //FIM DO CÓDIGO DO DRAWER

    );
  }
}



