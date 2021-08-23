import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Delivers/screens/HomeScreen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn'),
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
                                hintText: "Enter Username",labelText: "Username",),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            decoration:InputDecoration(
                                hintText: "Enter Password", labelText: "Password",),
                          ),
                        ]
                    ),
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child:Text('   LogIn   ',
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
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
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
