import 'dart:async';
import 'package:flutter/material.dart';
import 'leftScreen.dart';
import 'rightScreen.dart';
import 'frontScreen.dart';
import 'backScreen.dart';
import 'upScreen.dart';
import 'downScreen.dart';
import 'arrivalScreen.dart';
import 'proceedScreen.dart';
import 'liftProceedScreen.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:vibration/vibration.dart';

class Pathway extends StatefulWidget {
  final String coordinate;
  final String start;
  final String dest;

  Pathway({Key key, @required this.coordinate,
    @required this.start, @required this.dest})
      : super(key: key);

  @override
  _PathwayState createState() => _PathwayState();
}

class _PathwayState extends State<Pathway> {
  Future<List> getData() async {
    Response response;
    if (widget.start == "default") {
      response = await get(
          'https://29eyv7sj06.execute-api.us-east-1.amazonaws.com/test/instructions?' +
              widget.coordinate +
              '&dest=' +
              widget.dest);
      // print(response.body);
    } else {
      response = await get(
          'https://29eyv7sj06.execute-api.us-east-1.amazonaws.com/test/instructions?' +
              widget.coordinate + '&dest=' + widget.dest + "&start=" + widget.start);
    }
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List directions = data['message'];
      //this.data = directions;
      return directions;
    } else {
      throw Exception("Failed to load EEEEEEEEE.");
    }
    //create object
//    Direction instructions = Direction(direction: directions);
//    return instructions;
  }

  @override
  void initState() {
    super.initState();
    //getData();
  }

/*
  void onForward() {
    setState(() {
      this.state = this.data[this.stateId++] as String ;
      Vibration.vibrate(
        pattern: [0, 1000],
      );
    });
  }



  void onBackward() {
    if (this.stateId > 0) {
      setState(() {
        this.state = this.data[this.stateId--] as String;
        Vibration.vibrate(
          pattern: [0, 500, 100, 500],
        );
      });
    }
  }
*/

  void vibrate(int state) {
    Vibration.vibrate(pattern: [0, 200, 0, 200]);
    //print("vibrated");
  }

  Widget convertDirection(String direction) {
    if (direction == 'start_tactile') {
      return proceedScreen();
    } else if (direction == 'start_lift') {
      return liftScreen();
    } else if (direction == 'end') {
      return Semantics(
        label: 'You have arrived at ' + widget.dest + ' Double tap to start a new journey',
          child: arrivalScreen(dest: widget.dest));
    } else if (direction == 'right') {
      return Semantics(
        label: 'Turn right',
          child: rightScreen());
    } else if (direction == 'left') {
      return Semantics(
          label:'Turn left',
          child: leftScreen());
    } else if (direction == 'front') {
      return Semantics(
        label: 'Go forward',
          child: frontScreen());
    } else if (direction == 'back') {
      return Semantics(
        label: 'Turn back',
          child: backScreen());
    } else {
      var liftDir = direction.split(" ");

      if (liftDir[0] == 'down') {
        return Semantics(
          label: 'Go down to level ' + liftDir[1],
            child: downScreen(level: liftDir[1]));
      } else if (liftDir[0] == 'up') {
        return Semantics(
            label: 'Go up to level ' + liftDir[1],
            child: upScreen(level: liftDir[1]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //while (this.data == null) {
    // do nothing
    //}

    return Scaffold(
        body: FutureBuilder<List>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("error: ${snapshot.error}");
                } else {
                  return PageView(onPageChanged: vibrate, children: [
                    ...snapshot.data
                        .map((direction) => convertDirection(direction))
                        .toList(),
                  ]);
                }
              } else {
                return CircularProgressIndicator();
              }
            }));

    /*
    return Scaffold(
      body: GestureDetector(
              onLongPress: onForward,
              onDoubleTap: onBackward,
              child: convertDirection(this.state)),
    ); */
  }
}
