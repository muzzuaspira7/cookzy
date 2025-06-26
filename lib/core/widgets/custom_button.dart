import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double radius;
  const AppButton({
    super.key,
    this.width = double.infinity,
    this.height = 35,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        height: height.h,
        // width: width.w,
        decoration: BoxDecoration(
          color: color ?? AppColors.button,
          borderRadius: BorderRadius.circular(radius.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: AppText(
              text: text ?? 'Button',
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: textColor ?? AppColors.unselected,
            ),
          ),
        ),
      ),
    );
  }
}
