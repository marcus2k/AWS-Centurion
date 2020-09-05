import 'package:flutter/material.dart';

class backScreen extends StatelessWidget {
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
                'Backward',
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
              child: Image.asset('assets/backward.png')),
        ],
      ),
    );
  }
}
