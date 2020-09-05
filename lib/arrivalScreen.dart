import 'package:flutter/material.dart';
import 'destinationScreen.dart';
import 'goingInOutScreen.dart';

class arrivalScreen extends StatelessWidget {

  final String dest;

  arrivalScreen({Key key, @required this.dest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
                child: Semantics(
                  excludeSemantics: true,
                  child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => goingInOutScreen()),
                        );
                      },
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                            child: Text(
                                'You have arrived at:',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text(
                                this.dest,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  color: Colors.black
                                )),
                          ),
                        ],
                      ),
                    ),
                ),
                ),
              ),
        );
  }
}