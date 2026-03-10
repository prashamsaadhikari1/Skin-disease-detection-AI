import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Passwords/ForgotPassword.dart';
import 'Passwords/PasswordTextField.dart';
import 'Signup.dart';
import '../Home/category/Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  late final FirebaseAuth _auth;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  Future<void> signInWithEmailAndPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        print('User ID: ${userCredential.user?.uid}');
        print('User Email: ${userCredential.user?.email}');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Home(userEmail: userCredential.user?.email ?? 'N/A'),
          ),
        );
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: FadeTransition(
              opacity: _animationController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Enter your credentials to login',
                          style:  GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.purple,
                              hintStyle: TextStyle(fontSize: 12.sp, fontFamily: GoogleFonts.inter().fontFamily),
                              contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 12.w),
                              hintText: 'Email Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.w),
                                borderSide: BorderSide(
                                  color: const Color(0xff4a205f),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 22.sp,
                                color: const Color(0xff6a208f),
                              ),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: double.infinity,
                          child: PasswordTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                            onChanged: (String) {},
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                  checkColor: Colors.white,
                                  activeColor: const Color(0xff4a205f),
                                ),
                                Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgetPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              height: 45.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: const Color(0xff4a205f),
                              ),
                              child: GestureDetector(
                                onTap: signInWithEmailAndPassword,
                                child: Center(
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.inter().fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.inter().fontFamily,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: const Color(0xff4a205f),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                        ),
                      ],
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
