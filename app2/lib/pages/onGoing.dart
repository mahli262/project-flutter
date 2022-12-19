// import 'dart:html';

// ignore_for_file: camel_case_types, sized_box_for_whitespace, file_names

import 'package:app2/pages/signIn.dart';
import 'package:app2/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app2/theme.dart';

class onGoing extends StatelessWidget {
  const onGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/img/photo-bg.png"),
              fit: BoxFit.cover,
              ),
              ),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 83,),
                Text("Catch film before everyone",
                style: GoogleFonts.vollkorn(
                  textStyle: TextStyle(
                    color: nd_text,
                    fontSize: 34,
                    fontWeight: FontWeight.w600
                  )
                  )),
                  const SizedBox(height: 10,),
                  Text("the most complete movie database",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: text,
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                    )
                  ),),
                  const SizedBox(height: 400,),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 194,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                              ),
                              backgroundColor: button_gold,
                              
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const signIn()));

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
                        const SizedBox(height: 20,),
                        Container(
                          width: 194,
                          height: 45,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: button_gold),
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                              ),
                              foregroundColor: button_gold
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const signUp()));
                            },
                            child: Text("Sign Up",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                // color: ,
                                fontSize: 14,
                                fontWeight: FontWeight.w600

                              )
                            ),),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}