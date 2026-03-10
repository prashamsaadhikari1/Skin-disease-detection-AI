import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Third_Degree extends StatelessWidget {
  const Third_Degree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Degree',
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
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
                image: AssetImage('lib/Assets/cancer/WhatsApp Image 2024-06-01 at 01.57.07_c4697b60.jpg'),
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
                  'Description:',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff4a205f),
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  '• Moist, reddened, blistered and painful to touch.\n'
                      '• Blanch to touch.\n'
                      '• Risk of developing into a third-degree burn. Moreover, reassess second-degree burns to ensure the injury has not converted to a third-degree burn.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'How to deal with it:',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff4a205f),
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'Treatment for second- and first-degree burns is similar. Your healthcare provider may prescribe a stronger antibiotic cream that contains silver, such as silver sulfadiazine, to kill bacteria. Elevating the burned area can reduce pain and swelling.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
