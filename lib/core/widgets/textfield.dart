import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class ReusableTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const ReusableTextfield({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(
            color: AppColors.text.withOpacity(0.2),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            if (prefixIcon != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Icon(prefixIcon, size: 20.sp, color: AppColors.text),
              ),
            Expanded(
              child: Center(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText ?? false,
                  maxLines: maxLines,
                  cursorColor: AppColors.primary,
                  style: TextStyle(color: AppColors.mainText, fontSize: 14.sp),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: hintText ?? "Enter text",
                    hintStyle: TextStyle(
                      color: AppColors.text.withOpacity(0.5),
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
