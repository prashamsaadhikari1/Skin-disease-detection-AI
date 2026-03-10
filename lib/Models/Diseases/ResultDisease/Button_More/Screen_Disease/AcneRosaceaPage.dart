import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinDiseases.dart';

class AcneAndRosacea extends StatelessWidget {
  const AcneAndRosacea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Acne and Rosacea',
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
          Container(
            height: 250.h,
            width: double.infinity, // Take full width
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/Assets/person-dealing-with-rosacea.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0.h),
                bottomRight: Radius.circular(8.0.h),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cause:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Acne is caused by clogged pores with oils and dead skin cells, while rosacea may be due to genetic and environmental factors, temperature changes, and emotional stress.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Symptoms:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Acne appears as pimples and blackheads, while rosacea shows as persistent redness and swelling of the face.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Treatment:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Use facial cleansers and ointments containing benzoyl peroxide or salicylic acid for acne, and anti-inflammatory medications and avoiding triggers for rosacea. Oral medications and laser treatments may also be included for advanced cases.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
