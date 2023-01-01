import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:covid_19/Auth/signIn.dart';
// import 'package:covid_19/Screens/bottomNAvBar.dart';
// import 'package:covid_19/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_buddy/Screens/bottomNAvBar.dart';
import 'package:news_buddy/Screens/splash.dart';

import 'Auth/signIn.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NewsBuddy());
}

User? user = FirebaseAuth.instance.currentUser;

class NewsBuddy extends StatelessWidget {
  const NewsBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: user != null ? NewsBottomBar() : SignIn(),
      home: SplashScreen(),
    );
  }
}
