import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class rightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Semantics(
            excludeSemantics: true,
            child: Text(
                'Right',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                )),
          ),
          SizedBox(
              height: 30
          ),

          Semantics(
              excludeSemantics: true,
              child: Image.asset('assets/right.png')),
        ],
      ),
    );
  }
}
