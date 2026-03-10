import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller; // Added this line
  final Function(String) onChanged;
  final String? Function(String?) validator;

  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isHidden,
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        focusColor: Colors.purple,
        hintStyle: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(color: Color(0xff4a205f)),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 22.sp,
          color: Color(0xff6a208f),
        ),
        suffixIcon: GestureDetector(
          onTap: _togglePasswordVisibility,
          child: Icon(
            _isHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            size: 22.sp,
            color: Color(0xff4a205f),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
