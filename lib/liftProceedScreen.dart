import 'package:flutter/material.dart';

class liftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: FlatButton(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
                  child: Text(
                      'Please proceed to the nearest lift!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 37,
                      )),
                ),
                Semantics(
                  label: 'Swipe left at every intersection. Tap to receive instructions',
                ),

                Expanded(
                    flex: 1,
                    child: Semantics(
                        excludeSemantics: true,
                        child: Image.asset('assets/lift.png'))
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
      ),
    );
  }
}
