import 'package:Delivers/screens/CancelRide.dart';
import 'package:Delivers/screens/Fare.dart';
import 'package:flutter/material.dart';


class Driver extends StatefulWidget {
  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
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
               height: 270.0,
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
                     Text("Your ride is few minutes away",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300)),
                     SizedBox(height: 10),
                     ListTile(
                        leading: Icon(Icons.account_circle_rounded, size: 44,),
                        title: Text("Areeb Shakur", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                        subtitle: Text("Corolla LED 1234", style : TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                        trailing: Icon(Icons.call, size: 29, color: Colors.teal),
                         onTap: () => print("Listtile Tapped"),
                        ),
                       SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.all(9.0,),
                          child: RaisedButton(
                             onPressed: () {
                               Navigator.push(
                               context,
                             MaterialPageRoute(builder: (context) => CancelRide()),
                             );
                            },
                             child: Text(
                                '                      CANCEL                    ',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Fare()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

