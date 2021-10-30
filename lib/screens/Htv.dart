import 'package:Delivers/screens/ProgressScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class Htv extends StatefulWidget {
  @override
  _HtvState createState() => _HtvState();
}

class _HtvState extends State<Htv> {
  var loader, truck;
  var distance;

  @override
  void initState() {
    super.initState();
    getDistance();
    getDataFromFb();
  }

  void getDistance() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var distance = Geolocator.distanceBetween(double.parse(prefs.get("startLat")), double.parse(prefs.get("startLng")), double.parse(prefs.get("endLat")), double.parse(prefs.get("endLng")));
    setState((){
      this.distance = distance/1000;
    });
  }

  void getDataFromFb() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CollectionReference vehiclesInDB = FirebaseFirestore.instance.collection('vehicles');

    var vehicles = await vehiclesInDB.where("type", isEqualTo: "HTV").get();

    vehicles.docs.forEach((item) => {
      if(item["name"] == "Truck"){
        setState(() {
          this.loader = item;
        })
      }else if(item["name"] == "Loader"){
        setState(() {
          this.truck = item;
        })
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(
           child:Card(
               child: Column(
                   children: <Widget>[
                     SizedBox(height: 30),
                     Text("Heavy Transport Vehicles",
                         style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                     SizedBox(height: 30),
                 ListTile(
                     leading: Image.asset('assets/pic6.jpg', width: 100, height: 100),
                     title: Text(loader != null ? loader["name"]: "LOADER", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                     trailing: Text('PKR ${loader != null ? (loader["ratePerKm"] * this.distance).round(): "0.00"}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                     onTap: () => print("Listtile Tapped"),
                 ),
                     SizedBox(height: 30),
                     ListTile(
                       leading: Image.asset('assets/pic5.jpg', width: 100, height: 100),
                       title: Text(truck != null ? truck["name"]: "TRUCK", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                       trailing: Text('PKR ${truck != null ? (truck["ratePerKm"] * this.distance).round(): "0.00"}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                       onTap: () => print("Listtile Tapped"),
                     ),
                     SizedBox(height: 30.0),
                     Padding(
                       padding: const EdgeInsets.all(9.0,),
                       child: RaisedButton(
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ProgressScreen()),
                           );
                         },
                         child: Text(
                           '                     Request Ride                    ',
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
           )
      /*Container(
        color: Colors.white54,

        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Text("Heavy Transport Vehicles",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
            Row(
              children: [
                Image.asset('assets/pic5.jpg', width: 100, height: 100),
                SizedBox(height:20.0, width: 20.0,),
                Text("Loader", style : TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0, width: 85.0,),
                Text("PKR 0.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Image.asset('assets/pic6.jpg', width: 100, height: 100),
                SizedBox(height:20.0, width: 20.0,),
                Text("Truck", style : TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0, width: 100.0,),
                Text("PKR 0.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              ],
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(9.0,),
              child: RaisedButton(
                onPressed: () {
                   Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => ProgressScreen()),
                  );
                },
                child: Text(
                  '                     Request Ride                    ',
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
      ),*/
         ),
      ),
    );
  }
}


