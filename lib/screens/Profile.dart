import 'package:flutter/material.dart';
import 'package:Delivers/screens/HomeScreen.dart';
import "../preferencesMethods.dart";

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isObscurePassword = true;
  String username= "", phone="", email="";

  @override
  void initState() {
    super.initState();
    final prefs = PreferencesMethods();
    prefs.getUserDetails('email').then((String email) {
      prefs.getUserDetails('username').then((String username) {
        prefs.getUserDetails('phone').then((String phone) {
          this.setState(() {
            this.username= username;
            this.email= email;
            this.phone= phone;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
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
        body:Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 60,
                    child: Text(this.username.substring(0,2).toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 32),),
                  )
                  // Stack(
                  //   children: [
                  //     Container(
                  //     width: 130, height: 130,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(width: 4, color: Colors.white),
                  //       boxShadow: [BoxShadow(
                  //         blurRadius: 10,
                  //         spreadRadius: 2,
                  //         color: Colors.black.withOpacity(0.8),
                  //       )
                  //       ],
                  //         shape: BoxShape.circle,
                  //         /*image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: NetworkImage(
                  //               'https://www.pexels.com/photo/palm-trees-at-beach-3214944/'
                  //           )
                  //         )*/
                  //     ),
                  //     ),
                  //     Positioned(
                  //       bottom: 0,
                  //         right: 0,
                  //         child: Container(
                  //           height: 40,
                  //             width: 40,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               border: Border.all(
                  //                 width: 4,
                  //                 color: Colors.teal)
                  //             ),
                  //           child: Icon(Icons.edit, color: Colors.teal),
                  //         ))
                  //   ],
                  // ),
                ),
                SizedBox(height: 30),
                buildTextField("Username", username , false, false),
                buildTextField("Email", email, false, false),
                // buildTextField("Password", "********", true),
                buildTextField("Phone Number", phone, false, false),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     OutlinedButton(
                //       onPressed: (){},
                //       child: Text("CANCEL", style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.black)),
                //       style: OutlinedButton.styleFrom(
                //         padding: EdgeInsets.symmetric(horizontal: 50),
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                //       ),
                //     ),
                //     ElevatedButton(onPressed: (){}, child: Text("SAVE", style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.white)),
                //       style: ElevatedButton.styleFrom(
                //         primary: Colors.teal,
                //         padding: EdgeInsets.symmetric(horizontal: 50),
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      );

  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField, bool enableField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        enabled: false,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(icon: Icon(Icons.remove_red_eye, color: Colors.black),
                  onPressed: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
                  }): null,
              contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(fontSize: 18,color: Colors.black),
        ),
      ),
    );
  }
}
