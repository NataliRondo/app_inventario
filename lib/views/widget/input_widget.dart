// ignore_for_file: camel_case_types

import 'package:app_inventario/utils/responsiveApp.dart';
import 'package:app_inventario/utils/variables.dart';
import 'package:flutter/material.dart';

class inputWidget extends StatelessWidget {
  final String campo;
  final TextEditingController controller;
  const inputWidget({
    required this.campo, required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: responsiveApp.wp(3)),
          child: SizedBox(
            height: responsiveApp.hp(5),
            width: responsiveApp.wp(30),
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
        ),
        SizedBox(
          height: responsiveApp.hp(5),
          width: responsiveApp.wp(3),
          child: const Text(":"),
        ),
        SizedBox(
          height: responsiveApp.hp(6),
          width: responsiveApp.wp(50),
          child: TextFormField(
            controller: controller,
            inputFormatters: alfaNumerico,
            textCapitalization: TextCapitalization.characters,
          ),
        ),
      ],
    );
  }
}
