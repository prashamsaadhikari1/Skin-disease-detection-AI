import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinCancer.dart';

class Basal_Cell_Carcinoma extends StatelessWidget {
  const Basal_Cell_Carcinoma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basal Cell Carcinoma',
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
          Image.asset('lib/Assets/cancer/bcc.jpg'),
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
                  'Basal cells are one of the three main types of cells in the top layer of the skin (epidermis). They shed as new cells form. BCC occurs when UV radiation from the sun or indoor tanning damages the DNA of basal cells, causing uncontrolled growth.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Appearance of BCC :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Can look like open sores, red patches, pink growths, shiny bumps, scars, or growths with slightly elevated, rolled edges and/or a central indentation.\n• May ooze, crust, itch, or bleed.\n• Commonly arise in sun-exposed areas.\n• In darker skin, about half of BCCs are pigmented (brown in color).',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
                Text(
                  'Danger and Risks of BCC :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Rarely spreads beyond the original tumor site.\n• Can grow and become disfiguring and dangerous if untreated.\n• Untreated BCCs can become locally invasive, destroying skin, tissue, and bone.\n• The longer treatment is delayed, the higher the risk of recurrence.\n• In rare cases, BCC can spread to other body parts and become life-threatening.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Precautions and Treatment :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Seek medical attention for any suspicious skin lesions.\n• Early detection and treatment are crucial to prevent complications and recurrence.',
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
