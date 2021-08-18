
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Util{

  void toastSucesso(String textoMsg)
  {
    Fluttertoast.showToast(
        msg: textoMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.blue,
        fontSize: 16.0
    );
  }

  void toastRodape(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Cliente inserido'),
        action: SnackBarAction(
            label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }




}