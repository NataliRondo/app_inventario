// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CardItem> cardItems = [];

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Card Demo shsfhjjhsfsfjh'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            // Mostrar las tarjetas existentes
            for (var item in cardItems) item.buildCard(),
            // Botón para agregar una nueva tarjeta
            ElevatedButton(
              onPressed: () {
                if (cardItems.isEmpty) {
                  setState(() {
                    cardItems.add(
                      CardItem(responsiveApp: responsiveApp, texto: "Case"),
                    );
                  });
                } else if (cardItems.length == 1) {
                  setState(() {
                    cardItems.add(
                      CardItem(responsiveApp: responsiveApp, texto: "Monitor"),
                    );
                  });
                } else if (cardItems.length == 2) {
                  setState(() {
                    cardItems.add(
                      CardItem(responsiveApp: responsiveApp, texto: "Teclado"),
                    );
                  });
                } else if (cardItems.length == 3) {
                  setState(() {
                    cardItems.add(
                      CardItem(responsiveApp: responsiveApp, texto: "Mouse"),
                    );
                  });
                } else {
                  setState(() {
                    cardItems.add(
                      CardItem(
                        responsiveApp: responsiveApp,
                      ),
                    );
                  });
                }
              },
              child: const Text('Agregar Tarjeta'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes guardar la información de los controladores
                for (var item in cardItems) {
                  print('Texto en el controlador: ${item.controller1.text}');
                  print('Texto en el controlador: ${item.controller2.text}');
                  print('Texto en el controlador: ${item.controller3.text}');
                  print('Texto en el controlador: ${item.controller4.text}');
                  print(
                      'Texto en el controlador: ${item.discoDuroController.text}');
                  print(
                      'Texto en el controlador: ${item.marcaController.text}');
                  print(
                      'Texto en el controlador: ${item.memoriaController.text}');
                  print(
                      'Texto en el controlador: ${item.modeloController.text}');
                  print(
                      'Texto en el controlador: ${item.observacionController!.text}');
                  print(
                      'Texto en el patrimonialController: ${item.patrimonialController.text}');
                  print(
                      'Texto en el procesadorController: ${item.procesadorController.text}');
                }
              },
              child: const Text('Guardar Información'),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  final String? texto;

  final ResponsiveApp? responsiveApp;
  const Items({super.key, this.texto, this.responsiveApp});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController? observacionController = TextEditingController();
  int rowCount = 1; // Inicializamos con una fila
  Widget buildCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 1; i <= rowCount; i++)
              Row(
                children: [
                  Text('Campo $i:'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: i == 1
                          ? controller1
                          : i == 2
                              ? controller2
                              : i == 3
                                  ? controller3
                                  : controller4,
                    ),
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                /**/
                setState(() {
                  rowCount++; // Agregar una fila cuando se presiona el botón
                });
              },
              child: const Text('Agregar Fila'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }
}

class CardItem {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  int rowCount = 1; // Inicializamos con una fila
  final TextEditingController patrimonialController = TextEditingController();
  final TextEditingController procesadorController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController memoriaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController discoDuroController = TextEditingController();
  final TextEditingController serieController = TextEditingController();
  final TextEditingController tarjVideoController = TextEditingController();
  final String? texto;
  final TextEditingController? observacionController = TextEditingController();
  final ResponsiveApp? responsiveApp;

  CardItem({this.responsiveApp, this.texto});
  Widget buildCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 1; i <= rowCount; i++)
              Row(
                children: [
                  Text('Campo $i:'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: i == 1
                          ? controller1
                          : i == 2
                              ? controller2
                              : i == 3
                                  ? controller3
                                  : controller4,
                    ),
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                /*setState(() {
                  rowCount++; // Agregar una fila cuando se presiona el botón
                });*/
              },
              child: const Text('Agregar Fila'),
            ),
          ],
        ),
      ),
    );
  }
}
