// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../utils/responsiveApp.dart';
import '../../utils/variables.dart';

class CampoFilaHardware extends StatelessWidget {
  final String? campo;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  const CampoFilaHardware({
    super.key,
    required this.responsiveApp,
    this.campo,
    this.controller1,
    this.controller2,
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), border: Border.all()),
            child: SizedBox(
              height: responsiveApp.hp(8),
              width: responsiveApp.wp(30),
              child: Padding(
                padding: EdgeInsets.only(
                  left: responsiveApp.dp(3),
                  top: responsiveApp.dp(2),
                ),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(
                    hintText: null,
                  ),
                  style: estilos(
                    responsiveApp,
                    3,
                    Colors.black,
                    FontWeight.bold,
                    FontStyle.normal,
                  ),
                  controller: controller1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: responsiveApp.hp(2),
          ),
          SizedBox(
            height: responsiveApp.hp(6),
            child: TextField(
              controller: controller2,
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
