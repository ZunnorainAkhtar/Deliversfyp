import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Delivers/screens/LogIn.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:Card(
            child: Column(
              children: <Widget>[
                Form(
                  child:Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:Column(
                        children:<Widget>[
                          TextFormField(
                            decoration:InputDecoration(
                                hintText: "Enter Username", labelText: "Username"),

                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration:InputDecoration(
                                hintText: "abc@gmail.com", labelText: "Email"),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            decoration:InputDecoration(
                                hintText: "Enter Password", labelText: "Password"),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration:InputDecoration(
                                hintText: "+92 3---------", labelText: "Phone Number"),
                          ),

                        ]
                    ),
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child:Text('   Register   ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                    color:Colors.teal,
                    textColor:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
