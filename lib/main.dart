import 'package:flutter/material.dart';
import 'package:SalesApp/screens/Splash.dart';


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'CRUD - APP',
    theme: ThemeData(primarySwatch: Colors.red),
    //home: DashboardPrincipal(),
    home: Splash(),
  ));
}

/*
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD - APP',
      theme: ThemeData(
          //primarySwatch: Color.blue,
          cardColor:Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: dashboard(),
    );
  }
}

 */