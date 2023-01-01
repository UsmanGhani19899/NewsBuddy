import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Auth/signIn.dart';
import 'package:news_buddy/Auth/signUp.dart';
import 'package:news_buddy/Widgets/customBtn.dart';
import 'package:news_buddy/main.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

User? users = FirebaseAuth.instance.currentUser;
int? snapshot;

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
// setState(() { fetchNegotiations();(context as Element).reassemble();});

    setState(() {
      users == null ? null : users;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: users == null && snapshot == null
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      Text(
                        'Please Login Or Create An Account',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Colors.transparent),
                        onPressed: () {
                          Get.to(SignIn());
                        },
                        child: Text(
                          'SignIn',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Colors.transparent),
                        onPressed: () {
                          Get.to(SignUp());
                        },
                        child: Text(
                          'SignUp',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  )
                ],
              ),
            )
          : user!.uid != user!.uid
              ? Container(
                  height: 300,
                  color: Colors.pink,
                )
              : Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .where('uid',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        snapshot = snapshot;
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> user =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${user['name']}'.toUpperCase(),
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Text(
                                      '${user['email']}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomBtn(
                                      btnName: 'Logout',
                                      onPressed: () {
                                        firebase_db.auth.signOut();
                                        Get.offAll(SignUp());
                                      },
                                    )
                                  ],
                                );
                              });
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ),
    );
  }
}
