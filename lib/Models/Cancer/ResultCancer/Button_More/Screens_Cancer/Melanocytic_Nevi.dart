import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinCancer.dart';

class Melanocytic_Nevi extends StatelessWidget {
  const Melanocytic_Nevi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Melanocytic Nevi',
          style: TextStyle(color: Colors.white, fontSize: 15.sp,fontWeight: FontWeight.w500,
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
          Image.asset('lib/Assets/cancer/MN2.jpg',
            height: 300.h,
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
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'Melanocytic nevi are benign tumors that arise in the skin. They have different sizes and colors as outlined above. Benign nevi are usually round or oval-shaped and are uniform in color. There are more nevi in areas of the body that have greater long-term exposure to the sun, such as the outer arm compared with the inner arm.',
                  style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Characteristics :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  '• Color: Tan to dark brown, pale pink, occasionally black.\n'
                      '• Shape: Round or oval.\n'
                      '• Borders: Smooth.\n'
                      '• Color Uniformity: Consistent throughout.\n'
                      '• Symmetry: Symmetrical when halved.',
                  style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Age-Related Changes :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                      )),
                Text(
                  'Nevi may lighten and elevate over time, becoming softer to the touch.',
                  style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Atypical Nevi :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                      )),
                Text(
                  '• Asymmetry: Uneven halves when divided.\n'
                      '• Borders: Irregular.\n'
                      '• Color: Varied within the mole.\n'
                      '• Size: Larger than a pencil eraser.',
                  style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Causes :',
                    style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    )
                ),
                Text(
                  'Genetic factors and sun exposure primarily influence the development of melanocytic nevi.',
                  style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Treatment :',
                    style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    )),
                Text(
                  '• Benign Nevi: Usually don\'t require treatment but can be removed if bothersome.\n'
                      '• Removal Methods: Shave technique or suture surgery.\n'
                      '• Atypical Nevi: Biopsied if there\'s concern about melanoma.',
                  style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
