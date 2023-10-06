// ignore_for_file: file_names
import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:app_inventario/views/widget/campoFila.dart';
import 'package:flutter/material.dart';

class HardwareView extends StatefulWidget {
  final String area;
  final String nombreMaquina;
  final String trabajador;
  final String usuarioMaquina;
  const HardwareView({
    super.key,
    required this.area,
    required this.nombreMaquina,
    required this.trabajador,
    required this.usuarioMaquina,
  });

  @override
  State<HardwareView> createState() => _HardwareViewState();
}

class _HardwareViewState extends State<HardwareView> {
  TextEditingController patrimonialController = TextEditingController();
  TextEditingController procesadorController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController memoriaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController discoDuroController = TextEditingController();
  TextEditingController serieController = TextEditingController();
  TextEditingController tarjVideoController = TextEditingController();
  TextEditingController observacionCaseController = TextEditingController();
  TextEditingController observacionMonitorController = TextEditingController();

  List<String> listaString = [];

  int numberOfCards = 1; // Variable para rastrear la cantidad de cards

  List<List<TextEditingController>> cardControllersList = [];

  @override
  void initState() {
    super.initState();
    cardControllersList
        .add([]); // Inicializa una lista vacía para la primera card
  }

  @override
  void dispose() {
    // Asegúrate de liberar los controladores cuando el widget se descargue
    for (var controllers in cardControllersList) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void _addCard() {
    setState(() {
      numberOfCards++; // Incrementa la cantidad de cards
      cardControllersList
          .add([]); // Inicializa una lista vacía para la nueva card
    });
  }

  void _addTextField(int cardIndex) {
    setState(() {
      for (int i = 0; i < 2; i++) {
        cardControllersList[cardIndex].add(TextEditingController());
      }
    });
  }

  void _printValues() {
    for (var controllers in cardControllersList) {
      for (var controller in controllers) {
        print(controller.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);

    List<Widget> cardWidgets = [];

    for (int i = 0; i < numberOfCards; i++) {
      List<TableRow> tableRows = [];

      if (cardControllersList[i].isNotEmpty) {
        // Agrega los TextField y SizedBox a la tabla
        for (int j = 0; j < cardControllersList[i].length; j++) {
          tableRows.add(
            TableRow(
              children: [
                MyCustomWidget(
                  controller: cardControllersList[i][j],
                  labelText: 'Campo 1 en Card $i',
                ),
                SizedBox(
                  width: responsiveApp.wp(3),
                ),
                MyCustomWidget(
                  controller: cardControllersList[i]
                      [j + 1], // Controlador separado para cada campo
                  labelText: 'Campo 2 en Card $i',
                ),
              ],
            ),
          );
          // Saltar al siguiente conjunto de 3 controladores
          j += 1;
        }
      }

      cardWidgets.add(
        Card(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Patrimonial",
                          controller: patrimonialController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Procesador",
                          controller: procesadorController,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Marca",
                          controller: marcaController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Memoria",
                          controller: memoriaController,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Modelo",
                          controller: modeloController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Disco Duro",
                          controller: discoDuroController,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Serie",
                          controller: serieController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Tarjeta de Video",
                          controller: tarjVideoController,
                        ),
                      ],
                    ),
                    ...tableRows,
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _addTextField(i);
                },
                child: Text('Agregar Campo'),
              ),
            ],
          ),
        ),
      );
    }
    /*List<Widget> cardWidgets = [];

    for (int i = 0; i < numberOfCards; i++) {
      cardWidgets.add(
        Card(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveApp.dp(5),
                ),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(0.3),
                    2: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Patrimonial",
                          controller: patrimonialController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Procesador",
                          controller: procesadorController,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Marca",
                          controller: marcaController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Memoria",
                          controller: memoriaController,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Modelo",
                          controller: modeloController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Disco Duro",
                          controller: discoDuroController,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Serie",
                          controller: serieController,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(3),
                        ),
                        CampoFila(
                          responsiveApp: responsiveApp,
                          campo: "Tarjeta de Video",
                          controller: tarjVideoController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true, // Añadido para evitar un desbordamiento
                itemCount: cardControllersList[i].length,
                itemBuilder: (context, index) {
                  return MyCustomWidget(
                    controller: cardControllersList[i][index],
                    labelText: 'Campo $index en Card $i',
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _addTextField(i); // Agrega un nuevo TextField en esta card
                },
                child: const Text('Agregar Campo'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    }*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cards con TextField'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: cardWidgets,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCard,
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: _addCard,
          child: const Text('Agregar'),
        ),
        ElevatedButton(
          onPressed: _printValues,
          child: const Text('Imprimir'),
        ),
      ],
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  MyCustomWidget({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //const Text("data"),
          TextField(
            controller: controller,
            decoration: InputDecoration(labelText: labelText),
          ),
          // Puedes agregar otros widgets personalizados aquí
        ],
      ),
    );
  }
}
