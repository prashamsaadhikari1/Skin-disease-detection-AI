import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinDiseases.dart';

class Exanthems extends StatelessWidget {
  const Exanthems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exanthems and Drug Eruptions',
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
          Image.asset('lib/Assets/applying-moisturizer-skin-with-psoriasis.jpg'),
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
                  'Viral infections or allergic reactions to medications.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Symptoms:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'A rash that may be accompanied by itching or fever.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Treatment:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Discontinuing the causative medication under medical supervision and using antihistamines and corticosteroids.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
