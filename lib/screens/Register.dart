import 'package:firebase_database/firebase_database.dart';
import 'package:Delivers/main.dart';
import 'package:Delivers/screens/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Delivers/screens/LogIn.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formkey =GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print("Validated");
    }else{
      print("Not Validated");
    }
  }
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.reference();
  User firebaseUser;



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
                  autovalidate: true,
                  key: formkey,
                  child:Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:Column(
                        children:<Widget>[
                          TextFormField(
                            controller: userNameController,
                            keyboardType: TextInputType.text,
                            decoration:InputDecoration(
                                hintText: "Enter Username", labelText: "Username"),
                            validator: RequiredValidator(errorText: "Required"),

                          ),
                          SizedBox(height: 20,),
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
                                hintText: "Enter Password", labelText: "Password"),

                            validator: MultiValidator(
                              [
                                RequiredValidator(errorText: "Required"),
                                MinLengthValidator(6, errorText: "should contain at least 6 characters"),
                              ]
                            ),



                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration:InputDecoration(
                                hintText: "EnterPhone Number ", labelText: "Phone Number"),
                            validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(11, errorText: "Not A Valid Number"),
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
                    onPressed: () async{


                        if(formkey.currentState.validate()){
                          registerNewUser();
                      }


                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      child:Text("click here") ,
                      onPressed: (){ Navigator.push(
                              context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                     );
                      })
                  ],

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose()  {
    emailController.dispose();
    super.dispose();
  }
  void registerNewUser()async{
    String name = userNameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneNumberController.text.trim();
    String password = passwordController.text.trim();
    try{
      final User user = (await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;

      setState(() {
        if (user!=null){
          Fluttertoast.showToast(msg: "Congratulations, your account has been created successfully");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
        else
        {
          Fluttertoast.showToast(msg: "New user account has not been created");

        }

      });
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
  /* final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User firebaseUser;

  void registerNewUser(BuildContext context) async
  {
    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).catchError((errMsg){
    displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;
    if (firebaseUser!= null)
      {
        Map userDataMap = {
          "name": userNameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneNumberController.text.trim(),
        };
        usersRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Congratulations, your account has been created", context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

      }
        else
          {
            displayToastMessage("New user account has not been created", context);
          }
      }
  }

displayToastMessage(String message, BuildContext context )
{
  Fluttertoast.showToast(msg: message);
}*/
