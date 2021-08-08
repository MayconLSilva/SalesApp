import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

ThemeData CustomAppTheme() => ThemeData(

  //primarySwatch: Colors.red //Também uma forma de passar a cor primária "principal"
  //brightness: Brightness.dark, //Seria uma cor dark
  primaryColor: Colors.red[800], //Cor Principal
  accentColor: Colors.red[600],

  hintColor: Colors.black, //Cor dos hint dos campos
  scaffoldBackgroundColor: Colors.grey[350], //Cor do Fundo
  canvasColor: Color(0XFFBDBDBD), //Cor do Drawer
  //splashColor: Colors.teal, //Color(0xff457BE0), //Cor do splah quando clico ou pressione um botão
  //primaryIconTheme: IconThemeData(color: Colors.red), //COR DO MENU

  //COR DA LINHA ENVOLTA DO TEXTFIELD E OUTROS
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),//COR DA LINHA
    ),
    labelStyle: new TextStyle(color: Colors.grey[700]), //COR DO NOME DO CAMPO
    //hintStyle: TextStyle(color: Colors.red), //Cor do hint
  ),

  //COR DO CURSOR DO CAMPO
  textSelectionTheme: TextSelectionThemeData(
    cursorColor:  Colors.red[900],//Cor do cursor
    selectionColor:  Colors.grey[400],//Cor do texto selecionado
    //selectionHandleColor: Colors.amber,
  ),

  // QUAL A FONTE DE TEXTO PADRÃO
  fontFamily: 'Georgia',

  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 36.0, fontFamily: 'Hind'),
    //bodyText1: TextStyle(color: Colors.black, fontSize: 20.0),//Cor do texto do body, drawer
  ),

  // iconTheme: new IconThemeData(
  //     color: Colors.blue,
  //     opacity: 1.0,
  //     size: 50.0
  // ),


  /* OPÇÃO 2 PARA O ESTILO DE TEMA DO TEXTO
  textTheme: TextTheme(
     headline1: GoogleFonts.pompiere(
         fontSize: 72.0,
         fontWeight: FontWeight.bold,
         decoration: TextDecoration.none),
     headline6: GoogleFonts.pompiere(
         fontSize: 36.0,
         fontStyle: FontStyle.italic,
         decoration: TextDecoration.none),
     bodyText2: GoogleFonts.pompiere(
         fontSize: 14.0, decoration: TextDecoration.none),
     bodyText1: GoogleFonts.pompiere(
         fontSize: 14.0, decoration: TextDecoration.none),
  ),
  */


);



/*
LinearGradient LinearGradientDefault() => LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Colors.redAccent, Colors.green],
);
*/

/*
Widget TextTitle(text, {padding, alignCenter}) {
  return SimpleText(text,
      size: 30.0, padding: padding, alignCenter: alignCenter);
}
Widget TextSubtitle(text, {color, padding, alignCenter}) {
  return SimpleText(text, size: 20.0, color: color, alignCenter: alignCenter);
}

Widget SimpleText(text, {padding, color, alignCenter, required double size}) {
  return Padding(
    padding: padding ?? EdgeInsets.zero,
    child: Text(
      text,
      textAlign: alignCenter ?? false ? TextAlign.center : TextAlign.left,
      style: GoogleFonts.abel(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: color ?? Colors.white,
          decoration: TextDecoration.none),
    ),
  );
}
 */