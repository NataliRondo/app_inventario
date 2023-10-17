import 'package:flutter/material.dart';

import '../../utils/responsiveApp.dart';
import '../../utils/variables.dart';

class CampoFila extends StatelessWidget {
  final String campo;
  final TextEditingController controller;
  const CampoFila(
      {super.key,
      required this.responsiveApp,
      required this.campo,
      required this.controller});

  final ResponsiveApp responsiveApp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: responsiveApp.wp(3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: responsiveApp.hp(5),
            width: responsiveApp.wp(25),
            child: Text(
              campo,
              style: estilos(
                responsiveApp,
                3,
                Colors.black,
                FontWeight.bold,
                FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: responsiveApp.hp(6),
            child: TextField(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
