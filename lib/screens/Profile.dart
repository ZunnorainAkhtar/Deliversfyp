import 'package:flutter/material.dart';
import 'package:Delivers/screens/HomeScreen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isObscurePassword = true;
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
                  child: Stack(
                    children: [
                      Container(
                      width: 130, height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.black.withOpacity(0.1),
                        )
                        ],
                          shape: BoxShape.circle,
                          /*image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.pexels.com/photo/palm-trees-at-beach-3214944/'
                            )
                          )*/
                      ),
                      ),
                      Positioned(
                        bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.teal)
                              ),
                            child: Icon(Icons.edit, color: Colors.teal),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 30),
                buildTextField("Username", "Zunnorain Akhtar" , false),
                buildTextField("Email", "abc@gmail.com", false),
                buildTextField("Password", "********", true),
                buildTextField("Phone Number", "+92 3---------", false),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: (){},
                      child: Text("CANCEL", style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                    ElevatedButton(onPressed: (){}, child: Text("SAVE", style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  onPressed: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
                  }): null,
              contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(fontSize: 18,color: Colors.grey),
        ),
      ),
    );
  }
}
