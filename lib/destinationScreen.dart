import 'package:flutter/material.dart';
import 'goingInOutScreen.dart';
import 'pathway.dart';
import 'liftProceedScreen.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'settingScreen.dart';

class destinationScreen extends StatelessWidget {
  //final String choice;
  final String coordinate;
  final String start;
  final List dest;

  destinationScreen(
      {Key key,
      @required this.coordinate,
      @required this.start,
      @required this.dest})
      : super(key: key);

  Future<List> getDest() async {
    Response response = await get(
        'https://29eyv7sj06.execute-api.us-east-1.amazonaws.com/test/instructions?' +
            this.coordinate +
            '&dest=request');
    // print(response.body);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List directions = data['message'];
      //this.data = directions;
      return directions;
    } else {
//      print(response.statusCode);
//      print(this.coordinate);
      throw Exception("Failed to load AAAAAA.");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.start == "default") {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromRGBO(0, 24, 57, 100),
            title: Text(
              'Choose your destination',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )),
        body: FutureBuilder<List>(
            future: getDest(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("error: ${snapshot.error}");
                } else {
                  return new ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new RaisedButton(
                            padding: EdgeInsets.all(30),
                            color: Colors.white,
                            elevation: 100,
                            highlightColor: Color.fromRGBO(0, 24, 66, 100),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pathway(
                                            start: "default",
                                            coordinate: this.coordinate,
                                            dest: snapshot.data[index],
                                          )));
                            },
                            child: Text(
                              snapshot.data[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ));
                      });
                }
              } else {
                return CircularProgressIndicator();
              }
            }),
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => settingScreen()));
            },
            child: Semantics(
              label: 'Settings page',
              child: Icon(Icons.settings,
              size: 55,),
            ),
            backgroundColor: Color.fromRGBO(0, 24, 66, 100),
          ),
        ),
      ));
    } else {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromRGBO(0, 24, 57, 100),
            title: Text(
              'Choose your destination',
              style: TextStyle(fontSize: 22),
            )),
        body: ListView.builder(
            itemCount: this.dest.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new RaisedButton(
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  elevation: 100,
                  highlightColor: Color.fromRGBO(0, 24, 66, 100),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pathway(
                                coordinate: this.coordinate,
                                dest: this.dest[index],
                                start: this.start)));
                  },
                  child: Text(
                    this.dest[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ));
            }),
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => settingScreen()));
            },
            child: Semantics(
              label: 'Settings page',
              child: Icon(Icons.settings,
              size: 55,),
            ),
            backgroundColor: Color.fromRGBO(0, 24, 66, 100),
          ),
        ),
      ));
    }
  }
}
/*
    new ListView.builder(
    itemCount: destinations.length,
    itemBuilder: (BuildContext ctxt, int index) {
    return new RaisedButton(
    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Pathway()));
    },
    child: Text(destinations[index]));

    }
    ),
 */
