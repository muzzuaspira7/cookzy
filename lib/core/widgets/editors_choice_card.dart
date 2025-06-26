import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'app_text.dart';

class EditorsChoiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String authorName;
  final String authorImage;

  const EditorsChoiceCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.authorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: PhysicalModel(
        color: AppColors.background,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  imageUrl,
                  height: 80.h,
                  width: 110.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title,
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(authorImage),
                        ),
                        SizedBox(width: 6.w),
                        AppText(
                          text: authorName,
                          fontSize: 13.sp,
                          color: AppColors.text.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                height: 25.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.background,
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 5.w),
            ],
          ),
        ),
      ),
    );
  }
}
