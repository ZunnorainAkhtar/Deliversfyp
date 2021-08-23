import 'package:Delivers/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {

  double rating = 4.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Delivers"),
      ),
      body: Stack(
          children: [

            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 300.0,
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
                          Text("YOU ARRIVED", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                          SizedBox(height: 9,),
                          Text("Rating your driver", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                          SizedBox(height: 5,),
                          SmoothStarRating(
                            rating: rating,
                            size: 45,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            starCount: 5,
                            spacing: 2.0,
                            onRated: (value){
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                          Text('You have selected : $rating Star', style: TextStyle(fontSize: 15),),
                          SizedBox(height: 11,),
                          Padding(
                            padding: const EdgeInsets.all(9.0,),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              },
                              child: Text(
                                '                  Submit                    ',
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
