import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Passwords/PasswordTextField.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();

  bool _isEmailInUse = false;
  bool isMaleSelected = true;
  bool agreeToTerms = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      _showSuccessAlert();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showEmailInUseSnackBar();
      } else {
        print('FirebaseAuthException: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _showSuccessAlert() {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: 'Account Created Successfully',
      titleTextStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.inter().fontFamily
      ),
      text: 'Your account has been created successfully Welcome : ${_name.text}',
      confirmBtnColor: Color(0xff4a205f),
      confirmBtnTextStyle: TextStyle(color: Colors.white,
          fontFamily: GoogleFonts.inter().fontFamily
      ),
      backgroundColor: Color(0xff4a205f),
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }

  void _showEmailInUseSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.warning_amber,
              color: Colors.red.shade700,
            ),
            SizedBox(width: 10.w),
            Text(
              'Email already used !',
              style: TextStyle(color: Colors.red.shade700, fontSize: 12.sp,fontWeight: FontWeight.w600,          fontFamily: GoogleFonts.inter().fontFamily
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
          side: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.inter().fontFamily

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Please Create an account !',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.inter().fontFamily

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: _name,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Name is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 13.sp,fontFamily: GoogleFonts.inter().fontFamily),
                      filled: true,
                      focusColor: Colors.purple,
                      contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 12.w),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                        borderSide: BorderSide(color: Color(0xff4a205f)),
                      ),
                      prefixIcon: Icon(
                        Icons.perm_identity_sharp,
                        size: 22.sp,
                        color: Color(0xff6a208f),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: _email,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Email is empty';
                      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(text)) {
                        return 'Invalid email format';
                      } else if (_isEmailInUse) {
                        return 'This email is already in use';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 13.sp,fontFamily: GoogleFonts.inter().fontFamily),
                      filled: true,
                      focusColor: Colors.purple,
                      contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 12.w),
                      hintText: 'Email Address',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                        borderSide: BorderSide(color: Color(0xff4a205f)),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 22.sp,
                        color: Color(0xff6a208f),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  PasswordTextField(
                    hintText: 'Password',
                    controller: _password,
                    onChanged: (String text) {
                    },
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is empty !';
                      } else if (text.length < 6) {
                        return 'Password must be at least 6 characters !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMaleSelected = true;
                              });
                            },
                            child: Container(
                              height: 45.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.w),
                                color: isMaleSelected ? Color(0xff4a205f) : Colors.white,
                                border: Border.all(
                                  color: isMaleSelected ? Color(0xff4a205f) : Colors.grey,
                                  width: 2.w,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 25.sp,
                                    color: isMaleSelected ? Colors.white : Color(0xff4a205f),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: isMaleSelected ? Colors.white : Color(0xff4a205f),
                                      fontWeight: FontWeight.bold,
                                        fontFamily: GoogleFonts.inter().fontFamily
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Container for Female
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMaleSelected = false;
                              });
                            },
                            child: Container(
                              height: 45.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.w),
                                color: isMaleSelected ? Colors.white : Color(0xff4a205f),
                                border: Border.all(
                                  color: isMaleSelected ? Colors.grey : Color(0xff4a205f),
                                  width: 2.w,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: 25.sp,
                                    color: isMaleSelected ? Color(0xff4a205f) : Colors.white,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: isMaleSelected ? Color(0xff4a205f) : Colors.white,
                                      fontWeight: FontWeight.bold,
                                        fontFamily: GoogleFonts.inter().fontFamily

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Checkbox(
                        value: agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value ?? false;
                          });
                        },
                        activeColor: Color(0xff4a205f),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text(
                        'Accept Terms of service and Privacy',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.inter().fontFamily

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40.h),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate() && !_isEmailInUse) {
                            if (agreeToTerms) {
                              signUpWithEmailAndPassword();
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Row(
                                      children: [
                                        Icon(Icons.error_outline, color: Colors.red),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "Accept Terms",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                              fontFamily: GoogleFonts.inter().fontFamily

                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Text(
                                      "You must accept the Terms of Service and Privacy Policy.",
                                      style: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.w),
                                          ),
                                          backgroundColor: Color(0xff4a205f),
                                        ),
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                              fontFamily: GoogleFonts.inter().fontFamily

                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: Color(0xff4a205f),
                          ),
                          child: Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.inter().fontFamily
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.inter().fontFamily

                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              " Log in",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xff4a205f),
                                fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.inter().fontFamily

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
