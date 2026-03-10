import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinDiseases.dart';

class Vasculitis extends StatelessWidget {
  const Vasculitis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vasculitis',
          style: TextStyle(fontSize: 15.sp,color: Colors.white,fontFamily: GoogleFonts.inter().fontFamily,
          ),),
        backgroundColor: Color(0xff4a205f),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Image.asset('lib/Assets/Screenshot 2024-05-08 053316.png'),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start for English
              children: [
                Text(
                  'Cause:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Inflammation in blood vessels, which can be due to the immune system or an infection.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Symptoms:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Pain, redness, rash, and in some cases, internal organ problems.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Treatment:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Anti-inflammatory, immune-suppressing medications, or antibiotics depending on the cause.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
