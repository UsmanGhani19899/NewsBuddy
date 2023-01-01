import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:covid_19/Models/covid_model.dart';
// import 'package:covid_19/Models/sportsModel.dart';
// import 'package:covid_19/Screens/category.dart';
// import 'package:covid_19/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_buddy/Auth/signUp.dart';
import 'package:news_buddy/Core/firebase_database.dart';
import 'package:news_buddy/Screens/category.dart';

import '../../Models/sportsModel.dart';

class SportsNews extends StatefulWidget {
  // String? image;
  String? screenName;
  // String? description;
  SportsNewsModel? sportsModel;
  SportsNews({super.key, this.screenName, this.sportsModel});

  @override
  State<SportsNews> createState() => _SportsNewsState();
}

AnimationController? addToCartPopUpAnimationController;
User? user = FirebaseAuth.instance.currentUser;

class _SportsNewsState extends State<SportsNews> with TickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   addToCartPopUpAnimationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 800));
  //   addToCartPopUpAnimationController!.forward();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToCartPopUpAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // Timer(Duration(milliseconds: 400), () {
    // addToCartPopUpAnimationController!.forward();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            '${widget.screenName}',
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Text(
                '${widget.sportsModel!.sources!.length}',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
            )
          ],
        ),
        body: widget.sportsModel != null
            ? Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                        itemCount: sportsNews!.sources!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: Get.height * 0.12,
                            // width: 200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: CachedNetworkImage(
                                //     height: 60,
                                //     width: 60,
                                //     fit: BoxFit.cover,
                                //     imageUrl: '${widget.sportsModel!.sources![index].name}',
                                //     placeholder: ((context, url) =>
                                //         CircularProgressIndicator()),
                                //     errorWidget: (context, url, error) => Image(
                                //         height: 60,
                                //         width: 60,
                                //         fit: BoxFit.cover,
                                //         image:
                                //             AssetImage('assets/images/nope-not-here.png')),
                                //   ),
                                // ),
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      child: Icon(
                                        Icons.sports_basketball,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 200,
                                            child: Text(
                                              '${widget.sportsModel!.sources![index].name}',
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                              maxLines: 1,
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            child: Text(
                                              '${widget.sportsModel!.sources![index].description}',
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Container(
                                  height: 60,
                                  width: 60,
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("Users")
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return ListView.builder(
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                Map<String, dynamic> posts =
                                                    snapshot.data!.docs[index]
                                                            .data()
                                                        as Map<String, dynamic>;
                                                return IconButton(
                                                    onPressed: () {
                                                      if (user != null) {
                                                        FireBaseDatabase()
                                                            .savePost(
                                                                '${widget.sportsModel!.sources![index].name}',
                                                                '${widget.sportsModel!.sources![index].description}',
                                                                '${widget.sportsModel!.sources![index].category}',
                                                                // posts['postId'].toString(),
                                                                posts['postId']
                                                                    .toString(),
                                                                posts['postId']
                                                                    .toString());
                                                      } else {
                                                        addToCartPopUpAnimationController!
                                                            .forward();
                                                      }
                                                      // FireBaseDatabase().savePost(postName, postDes, postImage)

                                                      // firebase_db.savedPost(
                                                      //     posts['postId'].toString(),
                                                      //     mySaved!.uid.toString(),
                                                      //     posts['mySaved']);
                                                    },
                                                    icon: Icon(
                                                      Icons.bookmark_border,
                                                      color: Colors.white,
                                                    ));
                                              });
                                        } else {
                                          return Icon(
                                            Icons.bookmark_border,
                                            color: Colors.white,
                                          );
                                        }
                                      }),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  addToCartPopUp()
                ],
              )
            : Center(
                child: Lottie.asset('asset/images/95494-double-loader.json',
                    height: 110, width: 110),
              ));
  }

  addToCartPopUp() {
    return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(addToCartPopUpAnimationController!),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: [
              Card(
                color: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 12,
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Icon(Icons.error, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create An Account",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "SignIn",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            addToCartPopUpAnimationController!.reverse();
                          },
                          child: const Icon(Icons.cancel)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
