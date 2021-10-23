import 'package:Delivers/Models/Address.dart';
import 'package:Delivers/screens/Profile.dart';
import 'package:Delivers/screens/About.dart';
import 'package:Delivers/screens/Vehicle.dart';
import 'package:Delivers/screens/LogOut.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Delivers/Assistants/requestAssistant.dart';
import 'package:Delivers/Models/placePredictions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configMaps.dart';

class PickUp extends StatefulWidget {
  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  String username= "", email="";
  List<PlacePredictions> placePredictionList=[];



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
                      Text("Confirm Your PickUp Location", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20.0),
                      TextField(
                        onChanged: (val){
                          findPlace(val);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your PickUp Location"),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(5.0,),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Vehicle()),
                            );
                          },
                          child: Text(
                            '                     Confirm PickUp                    ',
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


                    ],
                  ),
                ),
              )


          ),
          SizedBox(height: 100.0,),
          (placePredictionList.length > 0)
              ? Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListView.separated(itemBuilder: (context,index){
              return PredictionTile(placePredictions: placePredictionList[index],);
            },
              separatorBuilder: (BuildContext context, int index) => DividerWidget(),
              itemCount: placePredictionList.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),
          ) : Stack()
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
              },
            )

          ],

        ),//
      ),

    );
  }


  void findPlace(String placeName) async{
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
        var predictions = res["predictions"];
        var placesList = (predictions as List).map((e) =>  PlacePredictions.fromJson(e)).toList();
        setState(() {
          placePredictionList = placesList;
        });
      }
    } else{
      setState(() {
        placePredictionList = [];
      });
    }
  }
  }


class PredictionTile extends StatelessWidget {
  final PlacePredictions placePredictions;
  PredictionTile({Key key, this.placePredictions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      onPressed: (){
        getplaceAddressDetails(placePredictions.place_id, context);

      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(width:10.0,),
            Row(
              children: [
                Icon(Icons.add_location),
                SizedBox(height: 14.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:8.0),
                      Text(placePredictions.main_text, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.0),),
                      SizedBox(height: 2.0,),
                      Text(placePredictions.secondary_text, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                      SizedBox(height:8.0),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(width:14.0),
          ],
        ),
      ),
    );
  }
}

void getplaceAddressDetails(String placeId, context) async
{
  String placeDetailsUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";
  var res = await RequestAssistant.getRequest(placeDetailsUrl);
  if(res == "failed")
  {
    return;
  }
  if(res["status"] == "OK")
  {
    Address address = Address();
    address.placeName = res["result"]["name"];
    address.placeId = placeId;
    address.latitude = res["result"]["geometry"]["location"]["lat"];
    address.longitude = res["result"]["geometry"]["location"]["lng"];

    //Provider.of<AppData>(context, listen: false).updateDropOffLocationAddress(address);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("startLat", '${address.latitude}');
    prefs.setString("startLng", '${address.longitude}');
    prefs.setString("startPlaceName", '${address.placeName}');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Vehicle()),
    );
  }
}


class DividerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Divider(
      height:1.0,
      color: Colors.yellowAccent,
      thickness: 1.0,
    );
  }}




