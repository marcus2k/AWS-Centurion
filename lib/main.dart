import 'package:first_app/startScreen.dart';
import 'package:flutter/material.dart';
import 'leftScreen.dart';
import 'rightScreen.dart';
import 'frontScreen.dart';
import 'backScreen.dart';
import 'proceedScreen.dart';
import 'liftProceedScreen.dart';
import 'arrivalScreen.dart';
import 'destinationScreen.dart';
import 'loadingScreen.dart';
import 'settingScreen.dart';
import 'upScreen.dart';
import 'downScreen.dart';
import 'pathway.dart';
import 'goingInOutScreen.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loadingScreen(),
      '/proceed': (context) => proceedScreen(),
      '/pathway': (context) => Pathway(),
      '/inout': (context) => goingInOutScreen(),
      '/dest': (context) => destinationScreen(),
      '/start': (context) => startScreen(),
//      '/location': (context) => ChooseLocation(),
    }
));

