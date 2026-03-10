import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Diseases/SkinDiseases.dart';


class Actinic_Keratoses extends StatelessWidget {
  const Actinic_Keratoses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actinic Keratoses',
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
          Image.asset(
            'lib/Assets/cancer/actinic-keratoses.jpg',
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
                  'Actinic Keratoses (also called solar keratoses) are dry, scaly patches of skin that have been damaged by the sun. It\'s not usually serious, but there\'s a small chance the patches could become skin cancer. Protecting your skin in the sun and watching out for changes can help.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Characteristics of Actinic Keratoses:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Texture: Dry, rough, scaly, or like sandpaper.\n'
                      '• Size: Typically 1–2 cm in diameter.\n'
                      '• Color: Can match skin tone or range from pink to red to brown.\n'
                      '• Sensation: May be itchy.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Common Locations:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Areas frequently exposed to the sun: face, hands, arms, ears, scalp, legs.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'When to See a Doctor:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• New patches appear.\n'
                      '• Patches bleed, enlarge, change color, feel tender, or develop into a lump.\n'
                      '• A patch appears on the lips.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Precautions:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Regular skin checks for changes.\n'
                      '• Use sunscreen with SPF 30 or higher; reapply regularly.\n'
                      '• Wear protective clothing and a hat when outdoors.\n'
                      '• Avoid sunbathing, sunlamps, and sunbeds.\n'
                      '• Stay out of the sun between 11 am and 3 pm when it is strongest.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Importance:',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'These measures help prevent actinic keratoses from worsening and reduce the risk of skin cancer.',
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
