import 'package:first_app/pathway.dart';
import 'package:flutter/material.dart';
import 'pathway.dart';
import 'destinationScreen.dart';
import 'package:geolocator/geolocator.dart';
import 'startScreen.dart';
import 'settingScreen.dart';

class goingInOutScreen extends StatefulWidget {
  @override
  _goingInOutScreenState createState() => _goingInOutScreenState();
}

class _goingInOutScreenState extends State<goingInOutScreen> {
//  Position _currentPosition;

//  String choice;

  Future<String> getCoordinate() async {
//    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return "latitude=" +
        position.latitude.toString() +
        '&longitude=' +
        position.longitude.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromRGBO(0, 24, 57, 100),
            title: Text('Where are you now?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ))),
        body: FutureBuilder<String>(
            future: getCoordinate(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("error: ${snapshot.error}");
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        height: 80,
                        minWidth: double.infinity,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => destinationScreen(
                                        start: "default",
                                        coordinate: snapshot.data,
                                        dest: [],
                                      )));
                        },
                        highlightColor: Color.fromRGBO(0, 24, 66, 100),
                        color: Colors.lightBlue[100],
                        child: Text(
                          'Station entrance',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        height: 80,
                        minWidth: double.infinity,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      startScreen(coordinate: snapshot.data)));
                        },
                        highlightColor: Color.fromRGBO(0, 24, 66, 100),
                        color: Colors.lightBlue[100],
                        child: Text(
                          'MRT platform',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                    ],
                  ));
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
        ));
  }
}
