import 'package:flutter/material.dart';


class downScreen extends StatelessWidget {
  String level;

  downScreen({this.level});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Semantics(
                    excludeSemantics: true,
                    child: Text(
                        'Lift down to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: Semantics(
                    excludeSemantics: true,
                    child: Text(
                        this.level,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        )),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Semantics(
                        excludeSemantics: true,
                        child: Image.asset('assets/liftdown.png'))
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
      ),
    );
  }
}
