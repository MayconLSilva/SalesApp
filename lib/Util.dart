
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:math';
import 'package:intl/intl.dart';

class Util{

  void toastSucesso(String textoMsg){
    Fluttertoast.showToast(
        msg: textoMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.blue,
        fontSize: 16.0
    );
  }

  void showToast(String textoMsg) => Fluttertoast.showToast(
      msg: textoMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      webBgColor: Colors.blue,
      textColor: Colors.blue,
      fontSize: 16.0
  );

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

  void alertaDadosInvalidos(BuildContext contextForm, String title) {
    showDialog(
      context: contextForm,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text("Preencha todos os campos corretamente."),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context), child: Text('Voltar'))
          ],
        );
      },
    );
  }

  static Future mensagem(BuildContext context, String mensagem) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Aviso"),
            content: new Text(mensagem),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }



  //Funções de formatação e conversão
  static int intFormat(String valor) {
    int ret = 0;
    try {
      return ret = int.parse(valor);
    } catch (e) {
      return ret;
    }
  }

  static String? dataFormat(String valor) {
    try {
      var dateTime1 = DateFormat('dd/MM/yyyy').parse(valor);
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(dateTime1);

      return formatted;
    } catch (e) {
      return null;
    }
  }

  static String? dataConvert(String valor) {
    try {
      var dateTime1 = DateFormat('yyyy-MM-dd').parse(valor);
      DateFormat formatter = DateFormat('dd/MM/yyyy');
      String formatted = formatter.format(dateTime1);

      return formatted;
    } catch (e) {
      return null;
    }
  }

  static double decimalFormat(String valor) {
    double ret = 0;
    try {
      return ret = double.parse(valor);
    } catch (e) {
      return ret;
    }
  }

  static String decimalConvert(double valorValor) {
    try {
      var f = new NumberFormat.currency(locale: 'pt-BR', decimalDigits: 2, symbol: '');

      return f.format(valorValor);
    } catch (e) {
      return "0,00";
    }
  }

  static String currency(double valorValor) {
    try {
      var f = new NumberFormat.currency(locale: 'pt-BR', decimalDigits: 2, symbol: 'R\S');
      // f.maximumFractionDigits = 2;
      return f.format(valorValor);
    } catch (e) {
      return "0,00";
    }
  }

  static String numeroConvert(double valorValor) {
    try {
      var f = new NumberFormat.currency(locale: 'pt-BR', decimalDigits: 2, symbol: '');

      return f.format(valorValor);
    } catch (e) {
      return "0,00";
    }
  }

}