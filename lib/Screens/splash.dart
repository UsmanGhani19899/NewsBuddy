import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Screens/bottomNAvBar.dart';
import 'package:news_buddy/Screens/connectUs.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool selected = false;

AnimationController? addToCartPopUpAnimationController;
User? user = FirebaseAuth.instance.currentUser;

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToCartPopUpAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    Timer(Duration(milliseconds: 900), () {
      addToCartPopUpAnimationController!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            // alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NEWS',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'BUDDY',
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //     alignment: Alignment.bottomCenter,
          //     child: SlideTransition(
          //       position: widget.offset,
          //       child: Padding(
          //         padding: EdgeInsets.all(70.0),
          //   child: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.arrow_forward_ios_rounded,
          //         color: Colors.white,
          //       )),
          // ),
          //     )),
          SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                      .animate(addToCartPopUpAnimationController!),
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(color: Colors.white)),
                    child: IconButton(
                        onPressed: () {
                          user == null
                              ? Get.off((ConnectSocial()))
                              : Get.off((NewsBottomBar()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        )),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
