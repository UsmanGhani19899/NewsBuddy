import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/utils.dart';
import 'package:news_buddy/Models/saveModel.dart';
import 'package:news_buddy/Screens/bottomNAvBar.dart';
import 'package:news_buddy/Screens/categories/sportsNews.dart';
import 'package:news_buddy/Screens/splash.dart';
import 'package:uuid/uuid.dart';
import '../Models/userModel.dart';

class FireBaseDatabase {
  final auth = FirebaseAuth.instance;
  signIn(
    String email,
    String password,
  ) {
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(SplashScreen()));
    } catch (e) {}
  }

  createUser(
    String name,
    String email,
    String password,
  ) {
    try {
      String postId = Uuid().v1();
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        UserModel userModel = UserModel(
            email: value.user!.email,
            name: name,
            uid: value.user!.uid,
            postId: postId,
            mySaved: []);

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(postId)
            .set(userModel.toMap());

        // userModel.email;
        // userModel.name;
        // userModel.uid;
      }).then((value) => Get.offAll(NewsBottomBar()));
    } catch (e) {}
  }

  Future<String> savedPost(String postId, String uid, List mySaved) async {
    String res = "Some error occurred";
    try {
      if (mySaved.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        FirebaseFirestore.instance.collection('Users').doc(postId).update({
          'mySaved': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        FirebaseFirestore.instance.collection('Users').doc(postId).update({
          'mySaved': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  savePost(
    String postName,
    String postDes,
    String postImage,
    String postId,
    // List savedPost,

    String? uid,
  ) async {
    try {
      String saveId = Uuid().v1();
      SaveModel saveModel = SaveModel(
          postId: saveId,
          postDes: postDes,
          postImage: postImage,
          postName: postName,
          uid: uid);
      // if (savedPost.contains(uid)) {
      //   await FirebaseFirestore.instance
      //       .collection('Users')
      //       .doc(postId)
      //       .collection('mySaved')
      //       .doc(postId)
      //       .update(saveModel.toMap());
      // } else {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(postId)
          .collection('mySaved')
          .doc(saveId)
          .set(saveModel.toMap());
      // }

      // userModel.email;
      // userModel.name;
      // userModel.uid;

    } catch (e) {
      print('$e');
    }
    ;
  }
}
