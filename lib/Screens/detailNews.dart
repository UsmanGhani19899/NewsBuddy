import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailNewsScreen extends StatefulWidget {
  String? image;
  String? imageName;
  String? imageDes;
  String? source;
  String? uploadAt;
  DetailNewsScreen(
      {super.key,
      this.uploadAt,
      this.image,
      this.imageDes,
      this.imageName,
      this.source});

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

bool isExpand = false;

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              child: Image(
                image: NetworkImage('${widget.image}'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          '${widget.source}',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          maxLines: 10,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          '${widget.uploadAt}',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          maxLines: 10,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${widget.imageName}',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${widget.imageDes}',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    maxLines: 10,
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Text(
            //     'Detail',
            //     style: GoogleFonts.roboto(color: Colors.blue),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
