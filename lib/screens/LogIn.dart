import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Delivers/screens/HomeScreen.dart';
import 'package:Delivers/screens/ForgotPassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Delivers/screens/Register.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'package:firebase_database/firebase_database.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> formkey =GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print("Validated");
    }else{
      print("Not Validated");
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final databaseRef = FirebaseDatabase.instance.reference();
  //User firebaseUser;

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
                  autovalidate: true,
                  key: formkey,
                  child:Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:Column(
                        children:<Widget>[
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:InputDecoration(
                                hintText: "abc@gmail.com", labelText: "Email"),
                            validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  EmailValidator(errorText: "Not A Valid Email"),
                                ]
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration:InputDecoration(
                                hintText: "Enter Password", labelText: "Password",),
                            validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  MinLengthValidator(6, errorText: "should contain at least 6 characters"),
                                ]
                            ),
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
                    onPressed: () async{

                      if(formkey.currentState.validate()){
                        setState(() {
                          signInWithEmailAndPassword();
                        });

                      }

                    }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        child:Text("click here") ,
                        onPressed: (){ Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                        })
                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot Password?"),
                    TextButton(
                        child:Text("click here") ,
                        onPressed: (){ Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                        })
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signInWithEmailAndPassword()async{
    try{
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final User user = (await _auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim())).user;

      if (user!=null){
        final DocumentSnapshot currentUser = await users.doc(user.uid).get();
        var data = Map<String, dynamic>.from(currentUser.data());

        prefs.setString('userId', user.uid);
        prefs.setString('username', data["username"]);
        prefs.setString('email', data["email"]);
        prefs.setString('phone', data["phone"]);

        Fluttertoast.showToast(msg: "Signed In successfully");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }

      // setState(() {
      //   if (user!=null){
      //     Fluttertoast.showToast(msg: "Signed In successfully");
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => HomeScreen()),
      //     );
      //   }
      //
      // });
    }catch(e){
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }

  }
}
