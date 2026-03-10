import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/Assets/cancer/man-dealing-with-rosacea-skin-condition-face.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width:double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.w),
                  topRight: Radius.circular(20.w),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      "Navigating Wounds",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromRGBO(47, 47, 47, 1),
                        fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily

                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Embark on a journey toward recovery. Discover how our app empowers you to navigate wounds with knowledge and care.",
                      style: TextStyle(
                        color: Color.fromRGBO(158, 158, 158, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
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
