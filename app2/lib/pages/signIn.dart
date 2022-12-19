// ignore_for_file: file_names, camel_case_types

import 'package:app2/pages/home.dart';
import 'package:app2/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:app2/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginSubmit () async {
    try {
      _firebaseAuth
        .signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text)
        .then((value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home())));
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: primary,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const SizedBox(height: 75,),
                Text("Sign In",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: text,
                    fontSize: 20,
                    fontWeight: FontWeight.normal
                  )
                ),
                ),
                Text("Save your watchlist",
                style: GoogleFonts.vollkorn(
                  textStyle: TextStyle(
                    fontSize: 28,
                    color: nd_text,
                    fontWeight: FontWeight.w600,
                  )
                ),),
                const SizedBox(height: 35,),
                Image.asset("assets/img/sign-in-anim.png",width: 178,height: 164,),
                const SizedBox(height: 36,),
                Text("Email Address",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: text,
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  )
                ),),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _emailController,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    )
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 10,bottom: 10,end: 0,top: 10),
                    fillColor: inputBg,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Password",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: text,
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  )
                ),),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    )
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 10,bottom: 10,end: 0,top: 10),
                    fillColor: inputBg,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                          // width: 194,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              backgroundColor: button_gold,

                            ),
                            onPressed: () {
                              loginSubmit();
                            },
                            child: Text("Sign In",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600

                              )
                            ),),
                          ),
                        ),
                  const SizedBox(height: 10,),
                        TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const signUp()));
                        } , 
                        child: Text("Create New Account",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: text,
                            fontSize: 14,
                            fontWeight: FontWeight.w500

                          )
                        ),
                        )
                        )
              ],
            ),
          ),
        ),
      ),
    );
  }
}