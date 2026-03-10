import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  CustomCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 16.0.w,
        height: 16.0.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xff4a205f),
            width: 1.0,
          ),
        ),
        child: Center(
          child: value
              ? Icon(
            Icons.check,
            size: 16.0.sp,
          )
              : null,
        ),
      ),
    );
  }
}
