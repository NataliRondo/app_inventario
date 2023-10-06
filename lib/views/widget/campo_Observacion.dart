// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../utils/responsiveApp.dart';
import '../../utils/variables.dart';

class CampoObservacion extends StatelessWidget {
  final String campo;
  final TextEditingController? controller;
  const CampoObservacion({
    super.key,
    required this.responsiveApp,
    required this.campo,
    this.controller,
  });

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
            //height: responsiveApp.hp(6),
            child: Container(
              height: responsiveApp.hp(10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: responsiveApp.dp(3), top: responsiveApp.dp(2)),
                child: TextField(
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(
                    hintText: null,
                  ),
                  controller: controller,
                  //expands: true,
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
          ),
          SizedBox(
            height: responsiveApp.hp(3),
          ),
        ],
      ),
    );
  }
}
