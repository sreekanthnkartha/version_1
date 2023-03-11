import 'package:flutter/material.dart';
import 'package:version_1/extra.dart';
import 'package:version_1/forgotpassword.dart';
import 'package:version_1/global.dart';
import 'package:version_1/home.dart';
import 'package:version_1/styles.dart';
import 'package:version_1/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _passwordVisible = false;
  void initState() { 

    _passwordVisible = false;
    
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.25,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: ListView(
                  shrinkWrap:
                      true, //you must add this if you place listview inside scrollview
                  physics:
                      NeverScrollableScrollPhysics(), //to prevent default scrolling of listview
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: emailController,
                        style: inputstyle(),
                        decoration: inputdec("Username", Icons.person_outline)),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: !_passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: passwordController,
                      style: inputstyle(),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: new BorderSide(color: Colors.black)),
                          focusedBorder: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: new BorderSide(color: Colors.cyan)),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: new BorderSide(color: Colors.black)),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 16, // or whatever
                            color: Colors.grey,
                            height:
                                2.2, //                                <----- this was the key
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 20,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.all(0),
                          isDense: true,
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                          onPressed: () async {
                            await ResetPassword(
                                context, emailController, firebaseAuth);
                            if (restsender == 1)
                              print("Reset Link has been Sent");
                          },
                          child: Text("Forgot password ?",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 17,
                              ))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: MaterialButton(
                        onPressed: () async {
                          // print(_emailController.toString() +
                          //     " " +
                          //     _passwordController.toString());
                          try {
                            await firebaseAuth
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) => print('Login Successful'));

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                          } catch (e) {
                            String error;
                            error = e.toString();
                            int kpp = error.lastIndexOf(']') + 1;
                            print("${error.substring(kpp)}");
                          }
                        },
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.cyan, //Color(0xffff2d55),
                        elevation: 0,
                        minWidth: 400,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "New user ?",
                    //     ),
                    //     MaterialButton(
                    //         onPressed: () {
                    //           // Get.toNamed("/register");
                    //         },
                    //         child: Text("Register now",
                    //             style: TextStyle(
                    //                 color: Colors.red[800],
                    //                 fontSize: 18,
                    //                 decoration: TextDecoration.underline)))
                    //   ],
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
