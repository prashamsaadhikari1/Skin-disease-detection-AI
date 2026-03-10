import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'lib/Assets/hands-patient-suffering-from-psoriasis.jpg',
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
                      "Identify skin burns",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color.fromRGBO(47, 47, 47, 1),
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "This application provides the technology of identifying the seriousness of burns and methods of treating them .",
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
