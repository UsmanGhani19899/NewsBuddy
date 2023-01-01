import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/categories/sportsNews.dart';

class CategoryCard extends StatelessWidget {
  final onTap;
  String? cardName;
  String? cardImage;
  CategoryCard({super.key, this.cardImage, this.cardName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            alignment: Alignment.bottomLeft,
            height: Get.height * 0.3,
            width: Get.width * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken),
                    image: AssetImage('$cardImage'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            alignment: Alignment.center,
            height: Get.height * 0.3,
            width: Get.width * 0.4,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              '$cardName',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.3)),
          )
        ],
      ),
    );
  }
}
