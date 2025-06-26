import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'app_text.dart';

class HeaderWidget extends StatelessWidget {
  final String header;
  final bool isSeeAll;
  final VoidCallback onTap;
  const HeaderWidget({
    super.key,
    required this.header,
    this.isSeeAll = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: header, fontWeight: FontWeight.w600, fontSize: 17.sp),
        if (isSeeAll)
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: onTap,
              child: AppText(
                text: "See All",
                color: AppColors.seeAll,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
