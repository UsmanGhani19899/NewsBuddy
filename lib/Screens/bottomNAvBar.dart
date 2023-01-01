// import 'package:covid_19/Screens/category.dart';
// import 'package:covid_19/Screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_buddy/Screens/profile.dart';
import 'package:news_buddy/Screens/saved_post.dart';

import 'category.dart';
import 'home.dart';

class NewsBottomBar extends StatefulWidget {
  const NewsBottomBar({super.key});

  @override
  State<NewsBottomBar> createState() => News_BottomStateBar();
}

int currentIndex = 0;
final screen = [
  HomeScreen(),
  Categories(),
  Container(
    height: 900,
    child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                Map<String, dynamic> user =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return SavedPost(
                  id: user['postId'],
                );
              });
        }),
  ),
  // Container(
  //   height: 900,
  //   color: Colors.black,
  //   child: StreamBuilder<QuerySnapshot>(
  //       stream: FirebaseFirestore.instance.collection('Users').snapshots(),
  //       builder: (context, snapshot) {
  //         return Container(
  //           height: 100,
  //           child: ListView.builder(
  //               itemCount: snapshot.data!.docs.length,
  //               itemBuilder: (context, index) {
  //                 Map<String, dynamic> mySaved =
  //                     snapshot.data!.docs[index].data() as Map<String, dynamic>;
  //                 return Flexible(
  //                   child: SavedPost(
  //                     id: mySaved['postId'],
  //                   ),
  //                 );
  //               }),
  //         );
  //       }),
  // ),

  MyProfile()
];

class News_BottomStateBar extends State<NewsBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.black,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile')
          ]),
    );
  }
}
