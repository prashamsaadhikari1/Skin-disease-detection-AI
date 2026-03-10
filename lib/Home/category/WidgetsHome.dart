import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Models/Cancer/SkinCancer.dart';
import '../../Models/Diseases/SkinDiseases.dart';
import '../../Models/skin_burn/SkinBurn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetsHome extends StatefulWidget {
  @override
  State<WidgetsHome> createState() => _WidgetsHomeState();
}

class _WidgetsHomeState extends State<WidgetsHome> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildGradientCard(),
              SizedBox(height: 50.h),
              buildButton(
                context,
                "Skin Burns",
                "Diagnosis & treatment",
                    () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkinBurns())),
              ),
              SizedBox(height: 20.h),
              buildButton(
                context,
                "Skin Diseases",
                "Symptoms & Causes",
                    () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkinDiseases())),
              ),
              SizedBox(height: 20.h),
              buildButton(
                context,
                "Skin Cancer",
                "Check for signs of skin cancer",
                    () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkinCancer())),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGradientCard() {
    return Stack(
      children: [
        Container(
          height: 185.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff4f0a87), Color(0xffa4508b)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.w),
          ),
        ),
        Container(
          height: 185.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            image: DecorationImage(
              image: AssetImage('lib/Assets/cancer/doctor-nurses-special-equipment.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context, String title, String subtitle, VoidCallback onPressed) {
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5.w,
            blurRadius: 7.w,
            offset: Offset(0.w, 3.w),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Icon(
                Icons.add_circle_outlined,
                color: Color(0xff4a205f),
                size: 30.sp,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff4a205f),
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
