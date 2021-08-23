import 'package:Delivers/screens/HomePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivers"),
        ),
        body: Container(
          color: Colors.white54,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //Center(
          //child:Padding(
          //padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            SizedBox(height: 50),
            Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text("D",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 50,
                    )),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                  gradient:
                      LinearGradient(colors: [Colors.black12, Colors.teal]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 8,
                        offset: Offset(2.0, 5.0))
                  ],
                )),
            SizedBox(height: 10),
            Text("DELIVERS",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            Text("Logistics Support System",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
            Image.asset('assets/pic1.jpg', width: 340, height: 340),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Icon(Icons.arrow_forward_ios),
        ));
  }
}
