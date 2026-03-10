import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../SkinCancer.dart';

class Melanoma extends StatelessWidget {
  const Melanoma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Melanoma',
          style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: GoogleFonts.inter().fontFamily,),
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
          Image.asset('lib/Assets/cancer/melanoma.jpg',
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
                  ),
                ),
                Text(
                  'Melanoma is a cancer that develops from melanocytes, the skin cells that produce melanin pigment, which gives skin its color.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Where is it usually found :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'Melanomas often resemble moles and sometimes may arise from them. They can appear on any body area, even in areas not typically exposed to the sun.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'What causes it :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'Melanoma is often triggered by the kind of intense, intermittent sun exposure that leads to sunburn. Tanning bed use also increases the risk of melanoma.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'How many people get it :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'In 2023, an estimated 186,680 new cases of melanoma are expected to occur in the U.S. Of those, 89,070 cases will be in situ (noninvasive), confined to the epidermis (the top layer of skin), and 97,610 cases will be invasive, penetrating the epidermis into the skin’s second layer (the dermis).',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),
                ),
                SizedBox(height: 10.h),
                Text(
                  'How serious is it :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                Text(
                  'Melanoma is the most dangerous of the three most common forms of skin cancer. Melanomas can be curable when caught and treated early. In 2023, melanoma is projected to cause about 7,990 deaths.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),
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
