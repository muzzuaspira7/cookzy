import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  const IconContainer({
    super.key,
    this.icon = Icons.favorite_border,
    this.bgColor = AppColors.background,
    this.iconColor = AppColors.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 34.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: bgColor,
      ),
      child: Icon(icon, size: 20.sp, color: iconColor),
    );
  }
}
