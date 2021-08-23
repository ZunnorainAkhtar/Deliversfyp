import 'package:Delivers/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
class CancelRide extends StatefulWidget {
  @override
  _CancelRideState createState() => _CancelRideState();
}

class _CancelRideState extends State<CancelRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivers"),
      ),
      body: Stack(
          children: [

            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 18.0),
                  child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text("Are you sure you want to cancel?", style : TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8,),
                        Text("This is taking longer than usual. We should have your driver within 10 minutes. If you cancel, you'll have to start your request again.", style : TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(9.0,),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                            child: Text(
                              '               Cancel request                   ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.teal,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
