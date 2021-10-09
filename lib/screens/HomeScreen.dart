import 'dart:async';

import 'package:Delivers/Assistants/requestAssistant.dart';
import 'package:Delivers/preferencesMethods.dart';
import 'package:Delivers/screens/Profile.dart';
import 'package:Delivers/screens/About.dart';
import 'package:Delivers/screens/PickUP.dart';
import 'package:Delivers/screens/LogOut.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configMaps.dart';
import "../preferencesMethods.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// localStorageInstance() async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> userDetails = [prefs.getString("email"),prefs.getString("username"),prefs.getString("phone")];
//   return userDetails;
// }

class _HomeScreenState extends State<HomeScreen>
{
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  String username= "", email="";

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    final prefs = PreferencesMethods();
    prefs.getUserDetails('email').then((String email) {
      prefs.getUserDetails('username').then((String username) {
        this.setState(() {
          this.username= username;
          this.email= email;
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivers"),
      ),
      body: Stack(
        children: [
            GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller)
          {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController =controller;
          },
        ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 260.0,
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
                      Text("Hi There,", style: TextStyle(fontSize: 19.0),),
                      Text("Where Do You Want To Deliver?", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20.0),
                      TextField(
                        /*onChanged: (val){
                          findPlace(val);

                      },*/
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your DropOff Location"),
                        ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(5.0,),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PickUp()),
                            );
                          },
                          child: Text(
                            '                     Confirm DropOff                    ',
                            style: TextStyle(
                              fontSize: 17,
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
                      //TextField(
                        //decoration: InputDecoration(
                          //  border: OutlineInputBorder(),
                            //hintText: "Enter your DropOff location"),
                      //),
                      /*Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 8.0,
                              spreadRadius: 1,
                              offset: Offset(0.7, 0.7),)
                          ]),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.teal,),
                            SizedBox(height:20.0, width: 20.0,),
                            Text(" Enter your dropOff location"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Icon(Icons.search, color: Colors.teal,),
                          SizedBox(width: 20.0,),
                          Text(" Enter your pickup location"),
                        ],
                      ) */
                    ],
                  ),
                ),
              )


          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(username),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                child: Text(username.substring(0,1).toUpperCase(), style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
              )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              //trailing: Icon(Icons.edit),
              //onTap: () => print("Listtile Tapped"),
              onTap: () {
                Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => Profile()),
                );}
            ),
            ListTile(
              leading: Icon(Icons.people_rounded),
              title: Text("About"),
              //trailing: Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );}
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              //trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogOut()),
                );
              },
            )

          ],

        ),//
      ),

    );
  }

  /*void findPlace(String placeName) async{
   if (placeName.length > 1)
       {
         String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&components=country:pk";
         var res = await RequestAssistant.getRequest(autoCompleteUrl);
         if(res == "failed")
         {
           return;
         }
         if(res["status"] == "OK")
           {
             var predictions = res ["predictions"];
             var placeList = (predictions as List).map((e) =>  PlacePredictions.fromJson(e)).toList();
           }
  }
  }*/
}



    