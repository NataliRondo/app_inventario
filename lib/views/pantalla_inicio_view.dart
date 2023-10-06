import 'package:app_inventario/utils/colores.dart';
import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:app_inventario/views/hardware_View.dart';
import 'package:app_inventario/views/software_View.dart';
import 'package:app_inventario/views/widget/botones.dart';
import 'package:app_inventario/views/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaInicioView extends StatefulWidget {
  const PantallaInicioView({super.key});

  @override
  State<PantallaInicioView> createState() => _PantallaInicioViewState();
}

class _PantallaInicioViewState extends State<PantallaInicioView> {
  TextEditingController areaController = TextEditingController();
  TextEditingController trabajadorController = TextEditingController();
  TextEditingController nombreMaquinaController = TextEditingController();
  TextEditingController usuarioMaquinaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AzulApp,
        title: const Text(
          "Inventario",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveApp.wp(4),
                  vertical: responsiveApp.hp(2),
                ),
                child: Column(
                  children: [
                    inputWidget(
                      campo: "Área",
                      controller: areaController,
                    ),
                    inputWidget(
                      campo: "Trabajador",
                      controller: trabajadorController,
                    ),
                    inputWidget(
                      campo: "Nombre de máquina",
                      controller: nombreMaquinaController,
                    ),
                    inputWidget(
                      campo: "Usuario de máquina",
                      controller: usuarioMaquinaController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModernButton(
                      text: "Hardware",
                      onPressed: () async {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const HardwareView(
                              area: "",
                              trabajador: "",
                              nombreMaquina: "",
                              usuarioMaquina: "",
                            ),
                          ),
                        );
                      },
                      iconData: Icons.hardware,
                    ),
                    SizedBox(
                      width: responsiveApp.dp(3),
                    ),
                    ModernButton(
                      text: "Software",
                      onPressed: () async {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SoftwareView(
                              area: "",
                              trabajador: "",
                              nombreMaquina: "",
                              usuarioMaquina: "",
                            ),
                          ),
                        );
                      },
                      iconData: Icons.personal_video_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
