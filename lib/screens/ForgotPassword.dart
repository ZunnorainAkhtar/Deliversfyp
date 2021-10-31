import 'package:Delivers/screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ForgotPassword extends StatefulWidget {

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print("Validated");
    }else{
      print("Not Validated");
    }
  }

  final emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('LogIn'),
    ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(top: 20.0),
              child:Text('Forgot Password?',
                style: TextStyle(fontSize: 30.0),
              ),
             ),
              SizedBox(height: 60,),
            Text('Enter the email address associated with the account'),
              Text('We will email you a link to reset your password!'),

            Expanded(
                child: Form(
                  key: formkey,
                   child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30 ),
                     child: ListView(
                       children: [
                         Container(
                             padding: EdgeInsets.symmetric(vertical: 10.0),
                           child: TextFormField(
                             controller: emailController,
                             decoration:InputDecoration(
                                 hintText: "abc@gmail.com", labelText: "Email", labelStyle: TextStyle(fontSize: 20.0)),
                             validator: MultiValidator(
                                 [
                                   RequiredValidator(errorText: "Required"),
                                   EmailValidator(errorText: "Not A Valid Email"),
                                 ]
                             ),
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RaisedButton(
                               child:Text('   Send Email   ',
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

                                            resetPassword();

                               },
                             ),


                           ],

                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Back to"),
                             TextButton(
                                 child:Text("LogIn") ,
                                 onPressed: (){ Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => LogIn()),
                                 );
                                 })
                           ],

                         ),
                       ],
                     ),
            ),

           ),
            ),
          ],
        )
    );
  }
  @override
  void dispose()  {
    emailController.dispose();
    super.dispose();
  }
  void  resetPassword()async{
    String email = emailController.text.toString();
    try{
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());

    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
      }
     }
  }


