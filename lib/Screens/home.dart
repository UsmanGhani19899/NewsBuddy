import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:covid_19/Core/api.dart';
// import 'package:covid_19/Core/webService.dart';
// import 'package:covid_19/Models/covid_model.dart';
// import 'package:covid_19/Models/top_news.dart';
// import 'package:covid_19/Screens/seeAll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_buddy/Screens/detailNews.dart';
import 'package:news_buddy/Screens/seeAll.dart';

import '../Core/api.dart';
import '../Core/webService.dart';
import '../Models/covid_model.dart';
import '../Models/top_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int newIndex = 0;
NewsModel? newsModel;
TopNewsModel? topNewsModel;
// Source? newsSource;

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getNews() async {
    try {
      var response = await WebService.getTestData(
          Apis.news, '''{"query":"","variables":{}}''');

      log('$response getting response');
      setState(() {
        newsModel = NewsModel.fromJson(jsonDecode(response));
        // news = newsModel.articles.first.
      });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> topHeadlines() async {
    try {
      var response = await WebService.getTopNews(
          Apis.topHeadlines, '''{"query":"","variables":{}}''');

      log('$response getting response');
      setState(() {
        topNewsModel = TopNewsModel.fromJson(jsonDecode(response));
        // news = newsModel.articles.first.
      });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> initalization() async {
    await getNews();
    await topHeadlines();
  }

  @override
  void initState() {
    // TODO: implement initState
    initalization();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'NEWS',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'BUDDY',
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )
              ],
            )),
        backgroundColor: Colors.black,
        body: newsModel != null || topNewsModel != null
            ? SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TOP HEADLINES',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SeeAll(
                                      newsModel: topNewsModel,
                                    ));
                                  },
                                  child: Text(
                                    'See all',
                                    style: GoogleFonts.roboto(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                              // scrollDirection: Axis.vertical,
                              itemCount: topNewsModel!.articles!.length,
                              itemBuilder: (context, index) {
                                if (topNewsModel != null) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Get.to(DetailNewsScreen(
                                      //   image:
                                      //       '${topNewsModel!.articles![index].urlToImage}',
                                      //   imageDes:
                                      //       '${topNewsModel!.articles![index].description}',
                                      //   imageName:
                                      //       '${topNewsModel!.articles![index].title}',
                                      //   source:
                                      //       '${topNewsModel!.articles![index].source!.name}',
                                      //   uploadAt:
                                      //       '${topNewsModel!.articles![index].publishedAt}',
                                      // ));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              height: 400,
                                              // width: 60,
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  '${topNewsModel!.articles![index].urlToImage}',
                                              placeholder: ((context, url) =>
                                                  Center(
                                                      child:
                                                          CircularProgressIndicator())),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: Icon(
                                                  Icons.broken_image_sharp,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                    end: Alignment.center,
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.black
                                                          .withOpacity(0.7),
                                                      Colors.black
                                                          .withOpacity(0.5),
                                                      Colors.black
                                                          .withOpacity(0.3),
                                                      Colors.black
                                                          .withOpacity(0.1),
                                                    ])),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                    child: Text(
                                                      '${topNewsModel!.articles![index].title}',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    )),
                                                // Container(
                                                //   height: 5,
                                                //   child: ListView.builder(
                                                //       scrollDirection:
                                                //           Axis.horizontal,
                                                //       itemCount: 3,
                                                //       itemBuilder:
                                                //           (context, index) {
                                                //         newIndex = index;

                                                //         return Container(
                                                //           margin: EdgeInsets
                                                //               .symmetric(
                                                //                   horizontal:
                                                //                       5),
                                                //           height: 4,
                                                //           width: 20,
                                                //           decoration: BoxDecoration(
                                                //               color: newIndex ==
                                                //                       index
                                                //                   ? Colors.white
                                                //                   : Colors.grey,
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           5)),
                                                //         );
                                                //       }),
                                                // ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Image(
                              //         image: NetworkImage('${newsModel!.articles!.last.urlToImage}')),
                              //     Text('${newsModel!.articles!.last.title}'),
                              //     Text('${newsModel!.articles!.last.description}'),
                              //     Image(image: NetworkImage('${newsModel!.articles!.last.url}')),
                              //   ],
                              // ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'LATEST NEWS',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SeeAll(
                                      newsModel: newsModel,
                                    ));
                                  },
                                  child: Text(
                                    'See all',
                                    style: GoogleFonts.roboto(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 2 / 1,
                                        crossAxisCount: 2),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  if (newsModel != null) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Get.to(DetailNewsScreen(
                                        //   image:
                                        //       '${newsModel!.articles![index].urlToImage}',
                                        //   imageDes:
                                        //       '${newsModel!.articles![index].description}',
                                        //   imageName:
                                        //       '${newsModel!.articles![index].title}',
                                        //   source:
                                        //       '${newsModel!.articles![index].source!.name}',
                                        //   uploadAt:
                                        //       '${newsModel!.articles![index].publishedAt}',
                                        // ));
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 200,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                  height: 60,
                                                  width: 60,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      '${newsModel!.articles![index].urlToImage}')),
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
                                                    width: 100,
                                                    child: Text(
                                                      '${newsModel!.articles![index].title}',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '${newsModel!.articles![index].description}',
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            // : Container(
            //     alignment: Alignment.center,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           'Technical Error',
            //           style: GoogleFonts.roboto(
            //               color: Colors.grey.withOpacity(0.7),
            //               fontWeight: FontWeight.bold,
            //               fontSize: 22),
            //         ),
            //         SizedBox(
            //           height: 8,
            //         ),
            //         Icon(
            //           Icons.error,
            //           color: Colors.grey.withOpacity(0.7),
            //         )
            //       ],
            //     ),
            //   )
            : Center(
                child: Lottie.asset('asset/images/95494-double-loader.json',
                    height: 110, width: 110),
              ));
  }
}
