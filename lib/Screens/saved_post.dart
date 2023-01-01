import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Core/firebase_database.dart';

class SavedPost extends StatefulWidget {
  String id;
  SavedPost({super.key, required this.id});

  @override
  State<SavedPost> createState() => _SavedPostState();
}

class _SavedPostState extends State<SavedPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(widget.id)
              .collection('mySaved')
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> mySaved =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Row(
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
                              mySaved['postImage'] == "business"
                                  ? Icons.business
                                  : Icons.sports_basketball,
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
                                    '${mySaved['postName']}',
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
                                    '${mySaved['postDes']}',
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

                      // Container(
                      //   height: 60,
                      //   width: 60,
                      //   child: StreamBuilder<QuerySnapshot>(
                      //       stream: FirebaseFirestore.instance
                      //           .collection("Users")
                      //           .snapshots(),
                      //       builder: (context, snapshot) {
                      //         return ListView.builder(
                      //             itemCount: 1,
                      //             itemBuilder: (context, index) {
                      //               Map<String, dynamic> posts =
                      //                   snapshot.data!.docs[index].data()
                      //                       as Map<String, dynamic>;
                      //               return IconButton(
                      //                   onPressed: () {
                      //                     FireBaseDatabase().savePost(
                      //                         '${widget.sportsModel!.sources![index].name}',
                      //                         '${widget.sportsModel!.sources![index].description}',
                      //                         '${widget.sportsModel!.sources![index].category}',
                      //                         // posts['postId'].toString(),
                      //                         posts['postId'].toString(),
                      //                         posts['postId'].toString());
                      //                     // FireBaseDatabase().savePost(postName, postDes, postImage)

                      //                     // firebase_db.savedPost(
                      //                     //     posts['postId'].toString(),
                      //                     //     mySaved!.uid.toString(),
                      //                     //     posts['mySaved']);
                      //                   },
                      //                   icon: Icon(
                      //                     Icons.bookmark_border,
                      //                     color: Colors.white,
                      //                   ));
                      //             });
                      //       }),
                      // ),
                    ],
                  );
                });
          }),
    );
  }
}
