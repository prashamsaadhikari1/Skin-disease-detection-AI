import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../SkinCancer.dart';

class Dermatofibroma extends StatelessWidget {
  const Dermatofibroma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dermatofibroma',
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
          Image.asset('lib/Assets/cancer/df.jpg',
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
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Dermatofibroma is a common benign fibrous nodule usually found on the skin of the lower legs. Dermatofibroma is also called a cutaneous fibrous histiocytoma.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Clinical Features :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Solitary, firm papule or nodule, usually on a limb.\n'
                      '• Can occur anywhere on the skin.\n'
                      '• Size: 0.5–1.5 cm in diameter, typically 7–10 mm.\n'
                      '• Tethered to the skin surface, mobile over subcutaneous tissue.\n'
                      '• Skin dimples on pinching (dimple or pinch sign).\n'
                      '• Color: Pink to light brown in lighter skin, dark brown to black in darker skin, sometimes paler in the center.\n'
                      '• Typically asymptomatic, but can be painful, tender, or itchy.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Clinical Variants :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  'Includes giant, eruptive, and multiple forms.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Causes :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Unclear if reactive or neoplastic; composed of proliferating fibroblasts and possibly histiocytes.\n'
                      '• Sometimes linked to minor trauma (insect bites, injections, thorn injuries).\n'
                      '• Multiple lesions can appear in immunocompromised patients (e.g., HIV, immunosuppression, autoimmune conditions).',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Complications :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Prone to trauma (e.g., from shaving).\n'
                      '• May erupt in large numbers in immunosuppressed individuals.\n'
                      '• Benign and does not become cancerous but can be confused with dermatofibrosarcoma protuberans or desmoplastic melanoma.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Diagnosis :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Diagnosed clinically with dermoscopy, showing a central white area with a faint pigment network.\n'
                      '• Atypical features (e.g., recent enlargement, ulceration, asymmetry) may warrant biopsy.\n'
                      '• Pathology shows spindle cell proliferation and collagen deposition. Variants include cellular, aneurysmal, epithelioid, atypical, lipidized ankle-type, palisading, cholesterotic.\n'
                      '• Immunohistochemical staining may be used for confirmation.',
                  style: TextStyle(fontSize: 12.sp,                    fontFamily: GoogleFonts.inter().fontFamily,),),

                SizedBox(height: 10.h),
                Text(
                  'Treatment :',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xff4a205f),fontWeight: FontWeight.w600,                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),),
                Text(
                  '• Usually requires no treatment, only reassurance.\n'
                      '• If problematic, surgical removal is an option, though recurrence is common.\n'
                      '• Cryotherapy, shave biopsy, and laser treatments are less effective.',
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
