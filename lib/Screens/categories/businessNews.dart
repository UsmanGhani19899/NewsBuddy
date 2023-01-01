import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:covid_19/Models/covid_model.dart';
// import 'package:covid_19/Models/businessModel.dart';
// import 'package:covid_19/Screens/category.dart';
// import 'package:covid_19/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_buddy/Auth/signUp.dart';
import 'package:news_buddy/Core/firebase_database.dart';
import 'package:news_buddy/Models/businessModel.dart';
import 'package:news_buddy/Screens/category.dart';

import '../../Models/businessModel.dart';

class Business extends StatefulWidget {
  // String? image;
  String? screenName;
  // String? description;
  BusinessNewsModel? businessModel;
  Business({super.key, this.screenName, this.businessModel});

  @override
  State<Business> createState() => _BusinessState();
}

User? mySaved = FirebaseAuth.instance.currentUser;

class _BusinessState extends State<Business> {
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
                '${widget.businessModel!.sources!.length}',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
            )
          ],
        ),
        body: widget.businessModel != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: widget.businessModel!.sources!.length,
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
                            //     imageUrl: '${widget.businessModel!.sources![index].name}',
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
                                    Icons.business,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                          '${widget.businessModel!.sources![index].name}',
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
                                          '${widget.businessModel!.sources![index].description}',
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
                                    return ListView.builder(
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          Map<String, dynamic> posts =
                                              snapshot.data!.docs[index].data()
                                                  as Map<String, dynamic>;
                                          return IconButton(
                                              onPressed: () {
                                                FireBaseDatabase().savePost(
                                                    '${widget.businessModel!.sources![index].name}',
                                                    '${widget.businessModel!.sources![index].description}',
                                                    '${widget.businessModel!.sources![index].category}',
                                                    // posts['postId'].toString(),
                                                    posts['postId'].toString(),
                                                    posts['postId'].toString());
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
                                  }),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            : Center(
                child: Lottie.asset('asset/images/95494-double-loader.json',
                    height: 110, width: 110),
              ));
  }
}
