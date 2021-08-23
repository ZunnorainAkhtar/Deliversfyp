import 'package:flutter/material.dart';
import 'package:Delivers/screens/Profile.dart';
import 'package:Delivers/screens/About.dart';
import 'package:Delivers/screens/LogOut.dart';
import 'package:Delivers/screens/Htv.dart';
import 'package:Delivers/screens/Ltv.dart';

class Vehicle extends StatefulWidget {
  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Delivers"),
      ),
      body: Stack(
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
                height: 180.0,
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
                      Text("Select Your Vehicle", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),

                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Ltv()),
                              );
                            },
                            child: Text("   LTV   ", style: TextStyle(fontSize: 25, letterSpacing: 2, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Htv()),
                              );
                            },
                            child: Text("   HTV   ", style: TextStyle(fontSize: 25, letterSpacing: 2, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                            ),
                          )
                        ],
                      )


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
                accountName: Text("Zunnorain Akhtar"),
                accountEmail: Text("zunnorainakhtar123@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("Z", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
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
              }
            )

          ],

        ),//
      ),

    );
  }
}








