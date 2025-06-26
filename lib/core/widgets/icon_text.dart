import 'package:cookzy/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class IconText extends StatelessWidget {
  final Color color;
  final String text;
  final String image;
  const IconText({
    super.key,
    required this.image,
    required this.text,
    this.color = AppColors.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 13.w, color: color),
          SizedBox(width: 5.w),
          AppText(text: text, maxLines: 2, fontSize: 12, color: color),
        ],
      ),
    );
  }
}
