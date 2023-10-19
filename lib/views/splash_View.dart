// ignore_for_file: file_names, avoid_print

import 'dart:async';
import 'package:app_inventario/views/inventario_View.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 6), () {
      loadWidget();
      print(timer!.isActive);
      timer!.cancel();
    });

    super.initState();
  }

  loadWidget() {
    Navigator.of(context).pushReplacement(
      //new
      MaterialPageRoute(
        builder: (context) => const InventarioView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //ResponsiveApp responsiveApp = ResponsiveApp(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("src/splash.gif"), fit: BoxFit.cover)),
        child: const Column(
          children: [
            /*(Platform.isIOS)
                ? Padding(
                    padding: EdgeInsets.only(
                      top: responsiveApp.width * 1.5,
                      bottom: responsiveApp.dp(20),
                    ),
                    child: SizedBox(
                      child: CupertinoActivityIndicator(
                        radius: 20,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: responsiveApp.width * 1.5,
                      bottom: responsiveApp.dp(20),
                    ),
                    child: SizedBox(
                      width: responsiveApp.wp(10),
                      height: responsiveApp.hp(10),
                      child: CircularProgressIndicator(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),*/
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
