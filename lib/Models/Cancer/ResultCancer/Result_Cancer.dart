import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../SkinCancer.dart';
import 'Button_More/Screens_Cancer/Benign_Keratosis.dart';
import 'Button_More/Screens_Cancer/Dermatofibroma.dart';
import 'Button_More/Screens_Cancer/Melanocytic_Nevi.dart';
import 'Button_More/Screens_Cancer/Melanoma.dart';
import 'Button_More/Screens_Cancer/Basal_Cell_Carcinoma.dart';
import 'Button_More/Screens_Cancer/Vascular Lesions.dart';
import 'Button_More/Screens_Cancer/Actinic_Keratoses.dart';

class ResultCancer extends StatelessWidget {
  final String result;
  final File? image;

  ResultCancer({required this.result, this.image});

  void navigateToCancerPage(BuildContext context) {
    if (result.contains('melanocytic_Nevi')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Melanocytic_Nevi()));
    } else if (result.contains('melanoma')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Melanoma()));
    } else if (result.contains('benign_keratosis-like_lesion')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Benign_Keratosis()));
    } else if (result.contains('dermatofibroma')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dermatofibroma()));
    } else if (result.contains('basal_cell_carcinoma')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Basal_Cell_Carcinoma()));
    } else if (result.contains('actinic_keratoses')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Actinic_Keratoses()));
    } else if (result.contains('vascular_lesions')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Vascular_Lesions()));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a205f),
        title: Text(
          'Result',
          style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 20.h),
              Text(
                result.isNotEmpty ? '$result' : 'No Cancer detected or normal skin !!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              SizedBox(height: 20.h),
              if (image != null)
                ElevatedButton(
                  onPressed: () {
                    navigateToCancerPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4a205f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    minimumSize: Size(double.infinity, 48.h),
                  ),
                  child: Text(
                    'More',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
