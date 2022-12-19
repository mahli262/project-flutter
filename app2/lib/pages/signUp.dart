// ignore_for_file: file_names, camel_case_types, sized_box_for_whitespace

import 'package:app2/pages/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app2/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSumit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => signIn()));
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()),);
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 75,),
                Text("Sign Up",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: text,
                    fontSize: 20,
                    fontWeight: FontWeight.normal
                  )
                ),),
                Text("Begin your journey",
                style: GoogleFonts.vollkorn(
                  textStyle: TextStyle(
                    fontSize: 28,
                    color: nd_text,
                    fontWeight: FontWeight.w600
                  )
                ),),
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
                              registerSumit();
                            },
                            child: Text("Sign Up",
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
   
                        // const SizedBox(height: 20,),
                        TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const signIn()));
                        } , 
                        child: Text("Back to Sign In",
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
          )
        )),
    );
  }
}