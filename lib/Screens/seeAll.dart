import 'package:cached_network_image/cached_network_image.dart';
// import 'package:covid_19/Models/covid_model.dart';
// import 'package:covid_19/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/Screens/home.dart';

import '../Models/covid_model.dart';

class SeeAll extends StatefulWidget {
  // String? image;
  // String? name;
  // String? description;
  final newsModel;
  SeeAll({super.key, this.newsModel});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: widget.newsModel!.articles!.length,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                width: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        imageUrl:
                            '${widget.newsModel!.articles![index].urlToImage}',
                        placeholder: ((context, url) =>
                            Center(child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Image(
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/nope-not-here.png')),
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
                              '${widget.newsModel!.articles![index].title}',
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
                              '${widget.newsModel!.articles![index].description}',
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
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
