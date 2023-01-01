import 'package:cached_network_image/cached_network_image.dart';
// import 'package:covid_19/Models/covid_model.dart';
// import 'package:covid_19/Models/techModel.dart';
// import 'package:covid_19/Screens/category.dart';
// import 'package:covid_19/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Models/techModel.dart';
import 'package:news_buddy/Screens/category.dart';

import '../../Models/techModel.dart';

class TechNews extends StatefulWidget {
  // String? image;
  String? screenName;
  // String? description;
  TechNewsModel? techModel;
  TechNews({super.key, this.screenName, this.techModel});

  @override
  State<TechNews> createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
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
              '${widget.techModel!.sources!.length}',
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: widget.techModel!.sources!.length,
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
                    //     imageUrl: '${widget.techModel!.sources![index].name}',
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
                            Icons.view_compact_alt_outlined,
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
                                  '${widget.techModel!.sources![index].name}',
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
                                  '${widget.techModel!.sources![index].description}',
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

                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        )),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
