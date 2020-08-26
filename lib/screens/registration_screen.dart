import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flash_chat/Animation/FadeAnimation.dart';
import 'package:flash_chat/components/rectangle_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = auth.FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String email;
  String name;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/light-1.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-2.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/clock.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[100]))),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  name = value;
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[100]))),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  email = value;
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  password = value;
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RectangleButton(
                      title: 'Register',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, ChatScreen.id);
                          }

                          setState(() {
                            showSpinner = false;
                          });
                        } catch (err) {
                          print(err);
                        }
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FadeAnimation(
                        1.5,
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//          TextField(
//            onChanged: (value) {
//              //Do something with the user input.
//            },
//            decoration: InputDecoration(
//              hintText: 'Enter your email',
//              contentPadding:
//                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//              border: OutlineInputBorder(
//                borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              ),
//              enabledBorder: OutlineInputBorder(
//                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              ),
//              focusedBorder: OutlineInputBorder(
//                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 8.0,
//          ),
//          TextField(
//            onChanged: (value) {
//              //Do something with the user input.
//            },
//            decoration: InputDecoration(
//              hintText: 'Enter your password',
//              contentPadding:
//                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//              border: OutlineInputBorder(
//                borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              ),
//              enabledBorder: OutlineInputBorder(
//                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              ),
//              focusedBorder: OutlineInputBorder(
//                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 24.0,
//          ),
//          Padding(
//            padding: EdgeInsets.symmetric(vertical: 16.0),
//            child: Material(
//              color: Colors.blueAccent,
//              borderRadius: BorderRadius.all(Radius.circular(30.0)),
//              elevation: 5.0,
//              child: MaterialButton(
//                onPressed: () {
//                  //Implement registration functionality.
//                },
//                minWidth: 200.0,
//                height: 42.0,
//                child: Text(
//                  'Register',
//                  style: TextStyle(color: Colors.white),
//                ),
//              ),
//            ),
//          ),
            ],
          ),
        ),
      ),
    );
  }
}
