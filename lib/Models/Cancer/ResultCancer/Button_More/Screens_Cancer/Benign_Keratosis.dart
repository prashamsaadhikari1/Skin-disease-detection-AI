import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinCancer.dart';

class Benign_Keratosis extends StatelessWidget {
  const Benign_Keratosis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Benign Keratosis',
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
          Image.asset('lib/Assets/cancer/BKL.jpg',
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
                  ),),
                Text(
                  'Seborrheic keratosis (Benign keratosis)  is a common non-cancerous (benign) skin tumor or growth that causes wart-like growths on the skin. These growths are also known as age spots, barnacles of aging, or wisdom spots.  People tend to get more of them as they get older. They are common in people over 50, but younger adults can also get them.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
                Text(
                  'Are Growths Harmful :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Seborrheic keratosis is not dangerous, but distinguishing between harmless and harmful growths is important. Growths that resemble seborrheic keratosis could be melanoma. Consult a healthcare professional if:\n'
                      '• There’s a new growth.\n'
                      '• An existing growth changes in appearance.\n'
                      '• There\'s only one growth (seborrheic keratosis usually appears in multiples).\n'
                      '• A growth has an unusual color (e.g., purple, blue, reddish-black).\n'
                      '• A growth has irregular borders (blurred, jagged, etc.).\n'
                      '• A growth is irritated or painful. If concerned about any growth, see a doctor or dermatologist to rule out serious conditions.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
                Text(
                  'Appearance of Seborrheic Keratosis :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Location:\n'
                      '• Multiple lesions can appear anywhere except the soles, palms, and mucous membranes.\n'
                      '• Common sites: scalp, face, chest, shoulders, abdomen, back.\n'
                      '• A sudden increase in number and size of lesions may indicate Leser-Trélat sign, potentially associated with certain cancers (stomach, colon, skin).\n'
                      'Texture:\n'
                      '• Starts as small, rough areas; develops a thick, wart-like surface over time.\n'
                      '• Often appears “stuck-on” and may look waxy and slightly raised.\n'
                      'Shape:\n'
                      'Usually round or oval.\n'
                      'Color:\n'
                      'Typically brown, but can be yellow, white, or black.\n'
                      'Symptoms:\n'
                      '• Usually asymptomatic.\n'
                      '• May be itchy or irritated, rarely painful.\n'
                      '• Can catch on clothing depending on location.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),
                SizedBox(height: 10.h),
                Text(
                  'Treatment and Removal :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Often, no treatment is needed.\n'
                      '• Removal may be considered for suspicious, uncomfortable, or cosmetically concerning growths.\n'
                      '• Procedures performed by a doctor, dermatologist, or physician assistant',
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
