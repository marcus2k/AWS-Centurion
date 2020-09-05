import 'package:flutter/material.dart';

class settingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(0, 24, 66, 100),
        ),
        body: Column(
          children: [
            RaisedButton(
                onPressed: () {},
                color: Colors.white,
                highlightColor: Color.fromRGBO(0, 24, 66, 100),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.language,
                      color: Color.fromRGBO(0, 24, 66, 100),
                      size: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Language preference',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                  ],
                )),
            RaisedButton(
                onPressed: () {},
                color: Colors.white,
                highlightColor: Color.fromRGBO(0, 24, 66, 100),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.vibration,
                      color: Color.fromRGBO(0, 24, 66, 100),
                      size: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Vibration toggle',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                  ],
                )),
            RaisedButton(
                onPressed: () {},
                color: Colors.white,
                highlightColor: Color.fromRGBO(0, 24, 66, 100),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.feedback,
                      color: Color.fromRGBO(0, 24, 66, 100),
                      size: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Feedback',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
