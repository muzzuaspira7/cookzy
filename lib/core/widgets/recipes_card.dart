import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'app_text.dart';
import 'icon_container.dart';
import 'icon_text.dart';

class RecipesCard extends StatelessWidget {
  final bool smallCard;
  final Map<String, dynamic> data;
  final VoidCallback? onTap;

  const RecipesCard({
    super.key,
    required this.data,
    this.smallCard = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 1.w, right: 16.w),
        child: PhysicalModel(
          color: AppColors.background,
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.r),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: smallCard ? 100.w : 185.w,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: smallCard ? 6.h : 10.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: smallCard
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          data['image'],
                          height: 75.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      AppText(
                        text: data['title'] ?? '',
                        maxLines: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Stack(
                          children: [
                            Image.network(
                              data['image'],
                              height: 100.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 10.h,
                              right: 10.w,
                              child: IconContainer(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      AppText(
                        text: data['description'] ?? '',
                        maxLines: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconText(
                            image: "assets/icons/fire.png",
                            text: "${data['kcal']} Kcal",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AppText(text: "•"),
                          ),
                          IconText(
                            image: "assets/icons/clock.png",
                            text: data['duration'] ?? '',
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
