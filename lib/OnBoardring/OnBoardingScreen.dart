import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Auth/LoginPage.dart';
import 'OnBoarding1.dart';
import 'OnBoarding2.dart';
import 'OnBoarding3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!;
        onLastPage = currentPage == 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPage = index.toDouble();
                onLastPage = (index == 2);
              });
            },
            children: const [
              OnBoarding1(),
              OnBoarding2(),
              OnBoarding3(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                        (index) => buildDot(index),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
                  child: ElevatedButton(
                    onPressed: () {
                      if (onLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4a205f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      minimumSize: Size(double.infinity, 48.h),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: Center(
                        child: Text(
                          onLastPage ? 'Get started' : 'Next',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: GoogleFonts.inter().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!onLastPage)
                  TextButton(
                    onPressed: () {
                      _controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48.h,
                      child: Center(
                        child: Text(
                          'Skip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.inter().fontFamily,
                            color: Color(0xff4a205f),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (onLastPage)
                  SizedBox(
                    width: double.infinity,
                    height: 23.h,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5.w, left: 5.w),
      width: 15.w,
      height: 5.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.r),
        color: currentPage == index ? Color(0xff4a205f) : Colors.grey,
      ),
    );
  }
}
