import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'dart:convert';
//
//class proceedScreen extends StatefulWidget {
//  @override
//  _proceedScreenState createState() => _proceedScreenState();
//}
//
//class _proceedScreenState extends State<proceedScreen> {
//
//  void getData() async {
//
//    Response response = await get('https://29eyv7sj06.execute-api.us-east-1.amazonaws.com/test/instructions?longitude=1.266276&latitude=103.820753&dest=CCL_DhobyGhaut');
//    // print(response.body);
//    Map data = jsonDecode(response.body);
//    print(data);
//    print(data['message']);
//
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Text('loading screen'),
//    );
//  }
//}

class proceedScreen extends StatelessWidget {
  //Widget child;
  //proceedScreen({Key key, @required this.child}) : super(key: key);
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
                      'Please proceed to the nearest tactile paving!',
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
                      child: Image.asset('assets/proceed.png')),
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




