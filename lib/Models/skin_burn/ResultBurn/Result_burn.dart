import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinscan/Models/skin_burn/ResultBurn/Button_more/First_Degree.dart';
import 'Button_more/Second_Degree.dart';
import 'Button_more/Third_Degree.dart';

class ResultBurn extends StatelessWidget {
  final String result;
  final File? image;

  ResultBurn({required this.result, this.image});

  void navigateToBurnPage(BuildContext context) {
    if (result.contains('First Degree burn')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => First_Degree()));
    } else if (result.contains('Second Degree burn')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Second_Degree()));
    }  else if (result.contains('Third Degree burn')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Third_Degree()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a205f),
        title: Text(
          'Result',
          style: TextStyle(color: Colors.white, fontSize: 15.sp, fontFamily: GoogleFonts.inter().fontFamily),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 20.h),
              Text(
                result.isNotEmpty ? '$result' : 'No burning or normal skin was detected. If you think there is a burn, reshoot clearly and try again!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily
                ),
              ),
              SizedBox(height: 20.h),
              if (image != null)
                ElevatedButton(
                  onPressed: () {
                    navigateToBurnPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4a205f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    minimumSize: Size(double.infinity, 48.h),
                  ),
                  child: Text(
                    'More',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        fontFamily: GoogleFonts.inter().fontFamily
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
