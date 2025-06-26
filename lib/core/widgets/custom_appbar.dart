import 'package:cookzy/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final String? title;
  final String? userName;

  const CustomAppBar({
    super.key,
    this.isHome = false,
    this.title,
    this.userName,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    if (isHome) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: AppColors.primary,
                        size: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      AppText(text: "Good Morning", fontSize: 12),
                    ],
                  ),
                ),

                AppText(
                  text: "Alena Sabyan",
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ],
            ),

            Spacer(),
            IconButton(
              iconSize: 22.sp,
              icon: Icon(Icons.shopping_cart_outlined, color: AppColors.dark),
              onPressed: () {},
            ),
          ],
        ),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          text: title ?? "",
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        leading: 
        
        IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      );
    }
  }
}
