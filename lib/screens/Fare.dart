import 'package:Delivers/screens/Rating.dart';
import 'package:flutter/material.dart';
class Fare extends StatefulWidget {
  @override
  _FareState createState() => _FareState();
}

class _FareState extends State<Fare> {
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
                height: 240.0,
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 18.0),
                    child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text("Your trip has been completed", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                          SizedBox(height: 12,),
                          Text("Total Fare: PKR 99.9", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                          SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.all(9.0,),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Rating()),
                                );
                              },
                              child: Text(
                                '                 Rate Driver                  ',
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
            ),
          ]
      ),
    );
  }
}
