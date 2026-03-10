import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Auth/LoginPage.dart';

class LogOut extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.logout,
        color: Colors.red,
        size: 22.sp,
      ),
      title: Text(
        'Log out',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      ),
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              title: Text(
                'Confirm Log Out',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              content: Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    backgroundColor: Color(0xff4a205f),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
