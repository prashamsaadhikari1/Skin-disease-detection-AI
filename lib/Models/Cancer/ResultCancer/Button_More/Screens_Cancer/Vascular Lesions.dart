import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinCancer.dart';

class Vascular_Lesions extends StatelessWidget {
  const Vascular_Lesions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vascular Lesions',
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
          Image.asset('lib/Assets/cancer/vascular4.png',
            height: 220.h,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What is it :',
              style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                ),),
                Text(
                  'Vascular lesions are patches of skin that look red, blue, or purple, caused by ruptured blood vessels under the skin. Vascular lesions on your skin may be present at birth or can develop later in life. Most of the time, vascular lesions don’t need medical treatment.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
                Text(
                  'Types of Vascular Lesions :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Birthmarks: Many types of vascular lesions, often called birthmarks, can be present from birth and may change over time. An example is port wine stains (nevus flammeus), which are flat vascular skin lesions.\n'
                      'Rosacea: A chronic condition characterized by facial redness, often mistaken for acne. It is not contagious but can spread and cause burning sensations if untreated.\n'
                      'Spider Veins: Small, red lines on the face and legs caused by bulging or enlarged capillaries. These veins can appear in anyone but are more common in some individuals.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
                Text(
                  'Treatment :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Vascular birthmarks can be reduced or removed with treatments, aiming for a 70 to 90 percent lightening.\n'
                      'Some vascular skin lesions and cafe au lait birthmarks can be treated to appear more normal.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}