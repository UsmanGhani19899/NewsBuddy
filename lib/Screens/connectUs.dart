import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Auth/signIn.dart';
import 'package:news_buddy/Auth/signUp.dart';
import 'package:news_buddy/Screens/bottomNAvBar.dart';
import 'package:news_buddy/Screens/home.dart';
import 'package:news_buddy/Widgets/customBtn.dart';

class ConnectSocial extends StatefulWidget {
  const ConnectSocial({super.key});

  @override
  State<ConnectSocial> createState() => _ConnectSocialState();
}

AnimationController? addToCartPopUpAnimationController;

class _ConnectSocialState extends State<ConnectSocial>
    with TickerProviderStateMixin {
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        // alignment: Alignment.st,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CREATE\nACCOUNT',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Connect With Us'.toUpperCase(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    CustomBtn(
                      btnName: 'SignIn',
                      onPressed: () {
                        Get.to(SignIn());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomBtn(
                      btnName: 'SignUp',
                      onPressed: () {
                        Get.to(SignUp());
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.off(NewsBottomBar());
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
