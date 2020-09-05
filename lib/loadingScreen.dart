import 'package:flutter/material.dart';
import 'goingInOutScreen.dart';
import 'package:flutter/scheduler.dart';

class loadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 24, 66, 100),
        body: FlatButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => goingInOutScreen()));
          },
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Color.fromRGBO(0, 24, 66, 100),
                          backgroundImage: AssetImage('assets/image.png'),
                        )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                        'Centurion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,

                        )
                    ),
                    Semantics(
                      label: 'We help the visually impaired navigate MRT stations'
                    )
                  ]
              )),
        ));
  }
}
