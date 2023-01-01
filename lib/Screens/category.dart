import 'dart:convert';
import 'dart:developer';

// import 'package:covid_19/Models/sportsModel.dart';
// import 'package:covid_19/Screens/sportsNews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Models/businessModel.dart';
import 'package:news_buddy/Models/techModel.dart';
import 'package:news_buddy/Screens/categories/businessNews.dart';
import 'package:news_buddy/Screens/categories/sportsNews.dart';
import 'package:news_buddy/Screens/categories/techNews.dart';

import '../Core/api.dart';
import '../Core/webService.dart';
import '../Models/covid_model.dart';
import '../Models/sportsModel.dart';
import '../Widgets/category_card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

TechNewsModel? techNewsModel;
SportsNewsModel? sportsNews;
BusinessNewsModel? businessNews;

class _CategoriesState extends State<Categories> {
  @override
  Future<void> getBusiness() async {
    try {
      var response = await WebService.getBusinessNews(
          Apis.business, '''{"query":"","variables":{}}''');

      log('$response getting response');
      setState(() {
        businessNews = BusinessNewsModel.fromJson(jsonDecode(response));
        // news = newsModel.articles.first.
      });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> getTech() async {
    try {
      var response = await WebService.getTechNews(
          Apis.tech, '''{"query":"","variables":{}}''');

      log('$response getting response');
      setState(() {
        techNewsModel = TechNewsModel.fromJson(jsonDecode(response));
        // news = newsModel.articles.first.
      });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> getSportsNews() async {
    try {
      var response = await WebService.getSportsNews(
          Apis.sports, '''{"query":"","variables":{}}''');

      log('$response getting response');
      setState(() {
        sportsNews = SportsNewsModel.fromJson(jsonDecode(response));
        // news = newsModel.articles.first.
      });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  // Future<void> getBuisnessNews() async {
  //   try {
  //     var response = await WebService.getTestData(
  //         Apis.covid, '''{"query":"","variables":{}}''');

  //     log('$response getting response');
  //     setState(() {
  //       newsModel = NewsModel.fromJson(jsonDecode(response));
  //       // news = newsModel.articles.first.
  //     });
  //   } catch (error) {
  //     print("error here in summary $error}");
  //   }
  // }

  Future<void> initialization() async {
    await getBusiness();
    await getSportsNews();
    await getTech();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'CATEGORIES',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                    cardImage: 'asset/images/sports.jpg',
                    cardName: 'Sports',
                    onTap: () {
                      Get.to(SportsNews(
                        screenName: 'Sports',
                        sportsModel: sportsNews,
                      ));
                    },
                  ),
                  CategoryCard(
                    cardImage: 'asset/images/tech.jpg',
                    cardName: 'Tech',
                    onTap: () {
                      Get.to(TechNews(
                        screenName: 'Technology',
                        techModel: techNewsModel,
                      ));
                    },
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(SportsNews(
                  //       sportsModel: sportsNews,
                  //       screenName: 'Sports',
                  //     ));
                  //   },
                  //   child: Stack(
                  //     alignment: Alignment.bottomLeft,
                  //     children: [
                  //       Container(
                  //         padding:
                  //             EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  //         alignment: Alignment.bottomLeft,
                  //         height: Get.height * 0.3,
                  //         width: Get.width * 0.4,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 colorFilter: ColorFilter.mode(
                  //                     Colors.black.withOpacity(0.2),
                  //                     BlendMode.darken),
                  //                 image: AssetImage('asset/images/sports.jpg'),
                  //                 fit: BoxFit.cover),
                  //             borderRadius: BorderRadius.circular(20)),
                  //       ),
                  //       Container(
                  //         alignment: Alignment.center,
                  //         height: Get.height * 0.3,
                  //         width: Get.width * 0.4,
                  //         padding:
                  //             EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  //         child: Text(
                  //           'Sports',
                  //           style: GoogleFonts.roboto(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 19),
                  //         ),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.black.withOpacity(0.3)),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(SportsNews(
                  //       sportsModel: sportsNews,
                  //       screenName: 'Sports',
                  //     ));
                  //   },
                  //   child: Stack(
                  //     alignment: Alignment.bottomLeft,
                  //     children: [
                  //       Container(
                  //         padding:
                  //             EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  //         alignment: Alignment.bottomLeft,
                  //         height: Get.height * 0.3,
                  //         width: Get.width * 0.4,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 colorFilter: ColorFilter.mode(
                  //                     Colors.black.withOpacity(0.2),
                  //                     BlendMode.darken),
                  //                 image: AssetImage('asset/images/tech.jpg'),
                  //                 fit: BoxFit.cover),
                  //             borderRadius: BorderRadius.circular(20)),
                  //       ),
                  //       Container(
                  //         alignment: Alignment.center,
                  //         height: Get.height * 0.3,
                  //         width: Get.width * 0.4,
                  //         padding:
                  //             EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  //         child: Text(
                  //           'Tech',
                  //           style: GoogleFonts.roboto(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 19),
                  //         ),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.black.withOpacity(0.3)),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                    cardImage: 'asset/images/business.jpg',
                    cardName: 'Business',
                    onTap: () {
                      Get.to(Business(
                        screenName: 'Sports',
                        businessModel: businessNews,
                      ));
                    },
                  ),
                  CategoryCard(
                    cardImage: 'asset/images/tech.jpg',
                    cardName: 'Tech',
                    onTap: () {
                      Get.to(TechNews(
                        screenName: 'Technology',
                        techModel: techNewsModel,
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
