import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../SkinDiseases.dart';
import 'Button_More/Screen_Disease/AcneRosaceaPage.dart';
import 'Button_More/Screen_Disease/EczemaPage.dart';
import 'Button_More/Screen_Disease/ExanthemsPage.dart';
import 'Button_More/Screen_Disease/ScabiesPage.dart';
import 'Button_More/Screen_Disease/TineaRingwormPage.dart';
import 'Button_More/Screen_Disease/VasculitisPage.dart';

class ResultDisease extends StatelessWidget {
  final String result;
  final File? image;

  ResultDisease({required this.result, this.image});

  void navigateToDiseasePage(BuildContext context) {
    if (result.contains('Vasculitis')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Vasculitis()));
    } else if (result.contains('Tinea Ringworm')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tinea()));
    }  else if (result.contains('Scabies')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Scabies()));
    } else if (result.contains('Exanthems and Drug Eruptions')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Exanthems()));
    } else if (result.contains('Eczema')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Eczema()));
    } else if (result.contains('Acne and Rosacea')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AcneAndRosacea()));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a205f),
        title: Text(
          'Result',
          style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: GoogleFonts.inter().fontFamily),
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
                result.isNotEmpty ? '$result' : 'No Diseases detected or normal skin !!',
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
                    navigateToDiseasePage(context);
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
