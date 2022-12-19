// ignore_for_file: file_names

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'package:flutter/src/widgets/container.dart';

// import 'package:flutter/src/foundation/key.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app2/pages/onGoing.dart';
import 'package:app2/theme.dart';
import 'dart:async';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const onGoing()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: primary,
          body: Center(child: Column(
            children: [
              const SizedBox(height: 299,),
              Image.asset("assets/img/pana.png",width: 130,height: 120,),
              const SizedBox(height: 10,),
              Text("Movie Time", 
              style: GoogleFonts.vollkorn(
                textStyle: TextStyle(
                color: nd_text,
                fontSize: 24,
                fontWeight: FontWeight.w500

              )
              ),)
      
            ],
          )),
        ),
      ),
    );
  }
}