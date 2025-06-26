import 'package:cookzy/core/widgets/custom_button.dart';
import 'package:cookzy/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';
import '../../../core/data/recipe_data.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/icon_container.dart';
import '../../../core/widgets/recipes_card.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailPage({super.key, required this.data});

  String getTrimmedText(String text, int maxChars) {
    if (text.length <= maxChars) return text;
    return '${text.substring(0, maxChars - 12)}... View More';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: 0.5.sh,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 0.5.sh,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.background.withOpacity(0.7),
                  AppColors.background.withOpacity(0.5),
                  AppColors.background.withOpacity(0.3),
                  AppColors.background.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: IconContainer(icon: Icons.close),
            ),
          ),
          Positioned(top: 50.h, right: 20.w, child: IconContainer()),
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.70,

            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.only(top: 10.h),

                  controller: scrollController,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Container(
                          color: Colors.grey[200],
                          width: 50.w,
                          height: 5.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: data['title'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock,
                              size: 15.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 5.w),
                            AppText(
                              text: data['duration'],
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    _buildDescription(data['description']),

                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoCard(
                          "${data['carbs']}g carbs",
                          Icons.bakery_dining,
                        ),
                        _infoCard(
                          "${data['protein']}g proteins",
                          Icons.set_meal,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoCard(
                          "${data['kcal']} Kcal",
                          Icons.local_fire_department,
                        ),
                        _infoCard("${data['fats']}g fats", Icons.oil_barrel),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: AppButton(radius: 15, text: "Add To Cart"),
                    ),
                    Divider(color: Colors.grey.shade200),
                    SizedBox(height: 5.h),
                    HeaderWidget(header: "Related Recipes", onTap: () {}),
                    _buildSmallRecipeList(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSmallRecipeList() {
    return Container(
      color: AppColors.background,
      height: 127.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyRecipes.length,
        itemBuilder: (context, index) {
          return RecipesCard(data: dummyRecipes[index], smallCard: true);
        },
      ),
    );
  }

  Widget _infoCard(String value, IconData icon) {
    return SizedBox(
      width: 150.w,
      child: Row(
        children: [
          IconContainer(icon: icon, bgColor: Colors.grey.shade200),
          SizedBox(width: 10.w),
          AppText(text: value, fontSize: 14, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}

Widget _buildDescription(String description) {
  const maxChar = 80;

  bool shouldTrim = description.length > maxChar;
  String visibleText = shouldTrim
      ? '${description.substring(0, maxChar).trim()}... '
      : description;

  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: visibleText,
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            color: Colors.grey.shade600,
          ),
        ),
        if (shouldTrim)
          TextSpan(
            text: 'View More',
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary,
            ),
          ),
      ],
    ),
  );
}
