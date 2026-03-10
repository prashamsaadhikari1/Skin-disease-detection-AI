import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class First_Degree extends StatelessWidget {
  const First_Degree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'First Degree',
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
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/Assets/cancer/Screenshot 2024-06-01 024559.png'),
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
                  '• Marked by red, pink or darkened skin.\n'
                      '• Painful and warm to touch.\n'
                      '• No blisters or skin sloughing present.\n'
                      '• Not included in TBSA calculation.',
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
                  'Run cool water over the burn. Don’t apply ice. For sunburns, apply aloe vera gel. '
                      'For thermal burns, apply antibiotic cream and cover lightly with gauze. '
                      'You can also take over-the-counter pain medication.',
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
