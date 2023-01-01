// import 'package:covid_19/Auth/signUp.dart';
// import 'package:covid_19/Widgets/customBtn.dart';
// import 'package:covid_19/Widgets/custome_feild.dart';
// import 'package:covid_19/Widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Auth/signUp.dart';

import '../Widgets/customBtn.dart';
import '../Widgets/custome_feild.dart';
import '../Widgets/password_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SIGNIN',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Text(
                      'WELCOME USER',
                      style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: Get.height * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomField(
                        controller: emailController,
                        fieldName: 'Email',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomPasswordField(
                        controller: passwordController,
                        fieldName: "Password",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.roboto(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              CustomBtn(
                btnName: 'SignIn',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    firebase_db.signIn(
                        emailController.text, passwordController.text);
                  } else {}
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUp());
                      },
                      child: Text(
                        'SignUp',
                        style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
