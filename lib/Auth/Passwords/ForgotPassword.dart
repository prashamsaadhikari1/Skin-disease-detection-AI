import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../LoginPage.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();
  bool _emailError = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _sendPasswordResetEmail() async {
    String email = _emailController.text.trim();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset Email Sent', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, fontFamily: GoogleFonts.inter().fontFamily),),
            content: Text('Please check your email for the password reset link.', style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily)),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  backgroundColor: Color(0xff4a205f),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                },
                child: Text('Done', style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.inter().fontFamily),),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error: ${e.message}', style: TextStyle(color: Colors.white),)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 20.sp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/Assets/Forgot password-rafiki.png',
                  height: screenSize.height * 0.35,
                  width: screenSize.width * 0.8,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenSize.height * 0.03),
                Text(
                  'Forgot your password?',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: GoogleFonts.inter().fontFamily),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                    'Enter your email below to receive your password reset instructions',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w600, fontFamily: GoogleFonts.inter().fontFamily,),
                    textAlign: TextAlign.center
                ),
                SizedBox(height: screenSize.height * 0.02),
                Form(
                  child: TextFormField(
                    controller: _emailController,
                    onChanged: (_) {
                      if (_emailError) {
                        setState(() {
                          _emailError = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 13.sp, fontFamily: GoogleFonts.inter().fontFamily),
                      filled: true,
                      focusColor: Colors.purple,
                      hintText: 'Email Address',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                        borderSide: BorderSide(color: Color(0xff4a205f)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 20.sp,
                        color: Color(0xff6a208f),
                      ),
                      errorText: _emailError ? 'Please enter a valid email' : null,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Center(
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Color(0xff4a205f),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (_emailController.text.isEmpty || !isValidEmail(_emailController.text)) {
                          setState(() {
                            _emailError = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.warning_amber,
                                    size: 20.sp,
                                    color: Colors.yellow.shade500,
                                  ),
                                  SizedBox(width: 10.0.w),
                                  Text('Please enter a valid email address', textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            _emailError = false;
                          });
                          _sendPasswordResetEmail();
                        }
                      },
                      child: Center(
                        child: Text(
                          "Send Link",
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: GoogleFonts.inter().fontFamily),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
