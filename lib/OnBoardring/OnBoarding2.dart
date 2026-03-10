import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/Assets/high-angle-magnifying-glass-mole.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.w),
                  topRight: Radius.circular(20.w),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "Skin cancer identification",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color.fromRGBO(47, 47, 47, 1),
                          fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.inter().fontFamily),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Technology to automatically scan the skin to look for new lesion",
                      style: TextStyle(
                        color: Color.fromRGBO(158, 158, 158, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.inter().fontFamily
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
