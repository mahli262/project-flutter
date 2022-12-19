import 'package:app2/theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  int pagesIndex=0;
  @override
  Widget build(BuildContext context) {
        FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }

    List<Widget> widget = [
      Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 75,),
                Text("Hi, Yasa",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: text,
                  )
                ),),
               Text("Just make a plan for a movie",
               style: GoogleFonts.vollkorn(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: nd_text
                )
               ),),
               SizedBox(height: 20,),
               Text("Trending Now",
               style: GoogleFonts.vollkorn(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: nd_text
                )
               ),),
               SizedBox(height: 10,),
               Image.asset("assets/img/trending-eg.png",width: 400, height: 242,),
              SizedBox(height: 20,),
              Text("Latest Movie",
              style: GoogleFonts.vollkorn(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: nd_text
                )
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Image.asset("assets/img/lts-1.png", width: 160,height: 203,),
                  SizedBox(width: 20,),
                  Image.asset("assets/img/lts-2.png", width: 160,height: 203,)
                ],
              ),


              ],
            ),
          ),
          
          


          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 67,),
                    Text("Explore the movie",
                    style: GoogleFonts.vollkorn(
                      textStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: nd_text
                      )
                    ),),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Image.asset("assets/img/db-1.png", width: 160,height: 203,),
                        SizedBox(width: 20,),
                        Image.asset("assets/img/db-2.png", width: 160,height: 203,)
                            ],
                          ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Image.asset("assets/img/db-3.png", width: 160,height: 203,),
                        SizedBox(width: 20,),
                        Image.asset("assets/img/db-4.png", width: 160,height: 203,)
                            ],
                          ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Image.asset("assets/img/db-5.png", width: 160,height: 203,),
                        SizedBox(width: 20,),
                        Image.asset("assets/img/db-6.png", width: 160,height: 203,)
                            ],
                          ),
                    SizedBox(height: 20,),

                  ],
                )
              ],
            ),
          ),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Center(
                  child: Text("Profile",
                  style: GoogleFonts.vollkorn(
                    textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: nd_text,
                      
                    )
                  ),
                  ),
                ),
                SizedBox(height: 25,),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/img/profile.png"),
                    radius: 101,
                  ),
                ),
                SizedBox(height: 25,),
                Text("Account",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: text
                  )
                ),),
                SizedBox(height: 10,),
                Text("${auth.currentUser!.email}",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: text
                  )
                ),),

                SizedBox(height: 240,),
                

                Center(
                  child: Container(
                            width: 194,
                            height: 45,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                backgroundColor: Color(0xffD66161),
                                
                              ),
                              onPressed: () {
                                  _signOut().then((value) => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                  builder: ((context) => signIn()))));
                              },
                              child: Text("Logout",
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600

                                )
                              ),),
                            ),
                          ),
                ),
              ],
            ),
          )


    ]
    ;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: primary,
          body: widget[pagesIndex],
















          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.explore, title: 'Explore'),
              TabItem(icon: Icons.people, title: 'Profile'),
            ],
            backgroundColor: button_gold,
            onTap: (index) {
              setState(() {
                pagesIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}