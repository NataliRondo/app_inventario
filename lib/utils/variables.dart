import 'dart:math';
import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe

TextStyle estilos(ResponsiveApp responsiveApp, double num, Color color,
    FontWeight font, FontStyle style) {
  return TextStyle(
      fontSize: responsiveApp.dp(num),
      fontWeight: font,
      fontFamily: 'Lato',
      color: color,
      fontStyle: style);
}

TextStyle fontStyleNotificaciones = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black);
//Color colorFondo = colorFromHex("#004a80");
DateTime fechaActual = DateTime.now();
String strHora = DateFormat('kk:mm:ss').format(fechaActual);
String strFecha = DateFormat('dd-MM-yyyy').format(fechaActual);

var formatters = [
  FilteringTextInputFormatter.deny('.'),
  FilteringTextInputFormatter.deny(','),
  //FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
  //FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
  FilteringTextInputFormatter.deny('/'),

  //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];
var soloLetras = [
  FilteringTextInputFormatter(RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚ\s-]*$'), allow: true),
];
var alfaNumerico = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Za-zA0-9-ZáéíóúÁÉÍÓÚ ]'))
];

DateFormat dateFormat = DateFormat("dd-MM-yyyy");
DateFormat formatoFecha = DateFormat("dd/MM/yyyy");

DateFormat formatoFechaTablaHojaRuta = DateFormat("dd/MM/yyyy h:mm:a");

//DateFormat formatoAsistencia= DateFormat("ddMMyyyy");
var colorRandom = Colors.primaries[Random().nextInt(Colors.primaries.length)];
const String oneSignalID = "d597d539-8967-43ab-85ee-4307b60bef58";
DateFormat dateFormato = DateFormat("yyyy-MM-dd");
DateFormat formatoAsistencia = DateFormat('yyy-MM-dd');
var listaImagenes = ["A.jpg", "B.jpg", "C.jpg", "D.jpg", "E.jpg"];

final randomImagen = Random();
var elementoRandom = listaImagenes[randomImagen.nextInt(listaImagenes.length)];
void showInSnackBar(String value, BuildContext context) {
  //scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(value),
    ),
  );
}

List<int> generateYearsList() {
  int currentYear = DateTime.now().year;
  List<int> yearsList =
      List<int>.generate(currentYear - 2007, (index) => currentYear - index);
  return yearsList;
}

var url = "https://oficinadigital.regionlalibertad.gob.pe/";

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

GlobalKey globalReunion = GlobalKey();
GlobalKey globalBoton = GlobalKey();
GlobalKey globalReunionVerTodos = GlobalKey();
GlobalKey globalReunionArchivado = GlobalKey();
