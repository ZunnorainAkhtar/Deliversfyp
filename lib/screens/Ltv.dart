import 'package:Delivers/screens/ProgressScreen.dart';
import 'package:flutter/material.dart';
class Ltv extends StatefulWidget {
  @override
  _LtvState createState() => _LtvState();
}

class _LtvState extends State<Ltv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivers"),
        ),
        body:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: SingleChildScrollView(
               child:Card(
                 child: Column(
                   children: <Widget>[
                    SizedBox(height: 30),
                     Text("Light Transport Vehicles",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                    SizedBox(height: 30),
                    ListTile(
                         leading: Image.asset('assets/pic2.jpg', width: 100, height: 100),
                         title: Text("Moto", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                         trailing: Text('PKR 0.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                             onTap: () => print("Listtile Tapped"),
                  ),
                    SizedBox(height: 30),
                    ListTile(
                        leading: Image.asset('assets/pic3.jpg', width: 100, height: 100),
                        title: Text("Auto", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                        trailing: Text('PKR 0.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                onTap: () => print("Listtile Tapped"),
                    ),
                    SizedBox(height: 30.0),
                     ListTile(
                       leading: Image.asset('assets/pic4.jpg', width: 100, height: 100),
                       title: Text("Car", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                       trailing: Text('PKR 0.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
       /* Container(
          color: Colors.white54,

          child: Center(
            child: Column(children: <Widget>[
              SizedBox(height: 30),
              Text("Light Transport Vehicles",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              Row(
                children: [
                  Image.asset('assets/pic2.jpg', width: 100, height: 100),
                      SizedBox(height:20.0, width: 20.0,),
                      Text("Moto", style : TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0, width: 80.0,),
                  Text("PKR 0.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset('assets/pic3.jpg', width: 100, height: 100),
                  SizedBox(height:20.0, width: 20.0,),
                  Text("Auto", style : TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0, width: 85.0,),
                  Text("PKR 0.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset('assets/pic4.jpg', width: 100, height: 100),
                  SizedBox(height:20.0, width: 20.0,),
                  Text("Car", style : TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0, width: 100.0,),
                  Text("PKR 0.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 20.0),
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
