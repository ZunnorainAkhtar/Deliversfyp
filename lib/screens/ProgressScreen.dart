import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Delivers/screens/Driver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState(){
    // TODO:implement initState
    super.initState();
    // Timer(Duration(seconds: 4), (){
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (_) => Driver()));
    // });
    checkRideStatus();
  }

  void checkRideStatus() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CollectionReference rides = FirebaseFirestore.instance.collection('rides');

    var rideId = prefs.getString("rideId");
    var rideDetails = await rides.doc(rideId).get();

    var rideStatus = rideDetails.get("status");
    print(rideStatus);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Delivers"),
      ),
      body:Stack(
        children: [
        /*  GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller)
          {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController =controller;
          },
        ),*/
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
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 18.0),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                   SizedBox(height: 6.0),
                   Text("Finding a Driver...", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),),
                   SizedBox(height: 20.0),
                   Text("Please wait...", style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),),
                   SizedBox(height: 10.0),
                   LinearProgressIndicator(
                       //backgroundColor: Colors.grey,
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