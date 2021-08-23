import 'package:flutter/material.dart';
import 'package:Delivers/screens/HomeScreen.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        //alignment: Alignment.center,
        //width: 100,
        //height: 100,
        child: Column(children: <Widget>[
          Container(
             padding: const EdgeInsets.all(16),
             child: Text("DELIVERS is an android based application which facilitates it’s users with a service which makes use of delivery of different items to the desired locations so that the access can be made more viable and secure and on a better platform. It ensures the items to be transferred towards the desired locations with complete zeal and with-out any constraints.",
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            )),),
            SizedBox(height: 10),
            Text("For more queries contact us on the official website www.delivers.com or visit our nearest branch.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

      ],
    ),
      ),
    );
  }
}