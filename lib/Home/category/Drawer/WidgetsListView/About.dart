import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  final String? userEmail;

  About({Key? key, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a205f),
        title: Text(
          'About',
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/Assets/skin-allergy-reaction-person-s-arm.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'In SkinScanTech, We are committed to providing valuable information and resources to help you understand and manage various skin conditions. Whether you suffer from burns, skin cancer, or any other skin condition, we now offer you the service of imaging or adding a photo to identify your skin problem and direct you to the appropriate diagnosis and treatment. We are here to support your every step throughout the entire process.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: 8.sp),

                  Text(
                    'Skin health is crucial. So learning about the symptoms and treatments of common skin problems like acne, toe eczema, psoriasis and many other skin conditions is important so that you can treat them effectively.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,

                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: 8.sp),

                  Text(
                    'Discover preventive measures to avoid burns, know the degree of burn, and see first aid tips for burn injuries.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,

                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    'We also seek to raise awareness and possible ways to detect skin cancer, so learn about the potential symptoms, risk factors, and the importance of early detection and prevention.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
