import 'package:flutter/material.dart';

import '../../utils/colores.dart';
import '../../utils/responsiveApp.dart';
import '../../utils/variables.dart';

class ModernButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconData;

  const ModernButton({required this.text, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: colorFondo,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: responsiveApp.dp(4),),
          SizedBox(width: responsiveApp.wp(1),),
          Text(
            text,
            style: estilos(responsiveApp, 3, Colors.white, FontWeight.normal,
                FontStyle.normal),
                textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
