import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinDiseases.dart';

class Eczema extends StatelessWidget {
  const Eczema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eczema',
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
          Image.asset('lib/Assets/skin-allergy-person-s-arm.jpg'),
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
                  'The exact causes are unknown, but it is linked to allergies and genetics.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Symptoms:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Dry skin, itching, redness, and the appearance of inflamed patches.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Treatment:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Regular use of moisturizers, avoiding triggers such as harsh soaps and rough clothing. Medical corticosteroids may be used, and light therapy can be considered for some cases.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
