import 'package:carousel_slider/carousel_slider.dart';
import 'package:cookzy/core/constants/colors.dart';
import 'package:cookzy/core/widgets/custom_button.dart';
import 'package:cookzy/core/widgets/header_widget.dart';
import 'package:cookzy/core/widgets/recipes_card.dart';
import 'package:cookzy/features/logic/category_controller.dart'
    show selectedCategoryIndexProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/recipe_data.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/icon_text.dart';
import '../detail/detail_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedCategoryIndexProvider);
    final categories = ["Breakfast", "Lunch", "Dinner"];

    return Scaffold(
      appBar: CustomAppBar(isHome: true, userName: "Ahmed Basha"),

      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(header: "Featured", onTap: () {}, isSeeAll: false),
                SizedBox(height: 10.h),

                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIdx) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: _buildFeaturedCard(),
                    );
                  },
                  options: CarouselOptions(
                    height: 160.h,

                    viewportFraction: 0.78,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    padEnds: false,
                    enlargeCenterPage: false,
                  ),
                ),
                SizedBox(height: 20.h),

                HeaderWidget(header: "Category", onTap: () {}),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      final isSelected = selectedIndex == index;
                      return AppButton(
                        width: 130.w,
                        text: categories[index],
                        color: isSelected
                            ? AppColors.button
                            : Colors.grey.shade300,
                        textColor: isSelected ? Colors.white : Colors.black,
                        onPressed: () {
                          ref
                                  .read(selectedCategoryIndexProvider.notifier)
                                  .state =
                              index;
                        },
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20.h),
                HeaderWidget(header: "Popular Recipes", onTap: () {}),
                // SizedBox(height: 10.h),
                _buildRecipeList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeList() {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyRecipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: RecipesCard(
              data: dummyRecipes[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(data: dummyRecipes[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Widget _buildFeaturedCard() {
  return Padding(
    padding: EdgeInsets.only(right: 15.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 280.w,
        decoration: BoxDecoration(color: AppColors.primary),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              child: Image.asset("assets/images/line.png", width: 180.w),
            ),
            Positioned(
              top: 10.h,
              left: 65.w,
              child: Container(
                width: 7.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
            Positioned(
              top: 60.h,
              left: 25.w,
              child: Transform.rotate(
                angle: 2.5,
                child: Container(
                  width: 10.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55.h,
              left: 120.w,
              child: Transform.rotate(
                angle: 2.5,
                child: Container(
                  width: 5.w,
                  height: 12.h,
                  color: AppColors.background,
                ),
              ),
            ),
            Positioned(
              top: -45.h,
              right: -40.w,
              child: Image.asset('assets/images/noodles.png', width: 160.w),
            ),
            Positioned(
              bottom: 10.h,
              left: 15.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180.w,
                    child: AppText(
                      maxLines: 2,
                      text: "Asian white noodle with extra sea",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.background,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 160.w,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1583394293214-28ded15ee548?q=80&w=580&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                            ),
                            SizedBox(width: 6.w),
                            AppText(
                              text: "James Spader",
                              fontSize: 13,
                              color: AppColors.lightGrey.withOpacity(0.8),
                            ),
                          ],
                        ),
                      ),
                      IconText(
                        image: "assets/icons/clock.png",
                        text: '20 Min',
                        color: AppColors.lightGrey.withOpacity(0.8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
