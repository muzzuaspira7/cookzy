// import 'package:cookzy/core/widgets/custom_appbar.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: CustomAppBar(title: "Search"));
//   }
// }

import 'package:cookzy/core/constants/colors.dart';
import 'package:cookzy/core/widgets/custom_button.dart';
import 'package:cookzy/core/widgets/header_widget.dart';
import 'package:cookzy/core/widgets/recipes_card.dart';
import 'package:cookzy/features/logic/category_controller.dart'
    show selectedCategoryIndexProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/editorschoice_data.dart';
import '../../../core/data/recipe_data.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/editors_choice_card.dart';
import '../../../core/widgets/textfield.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedCategoryIndexProvider);
    final categories = ["Breakfast", "Lunch", "Dinner"];

    return Scaffold(
      appBar: CustomAppBar(title: "Search"),

      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableTextfield(
                  hintText: "Search",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.search,
                ),
                SizedBox(height: 5.h),

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
                SizedBox(height: 10.h),
                _buildSmallRecipeList(),
                SizedBox(height: 20.h),
                HeaderWidget(header: "Editor's Choice", onTap: () {}),
                _buildEditorsChoiceCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditorsChoiceCard() {
    return ListView.builder(
      itemCount: editorsChoiceList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = editorsChoiceList[index];
        return EditorsChoiceCard(
          imageUrl: data["imageUrl"]!,
          title: data["title"]!,
          authorName: data["author"]!,
          authorImage: data["authorImage"]!,
        );
      },
    );
  }

  Widget _buildSmallRecipeList() {
    return Container(
      color: AppColors.background,
      height: 128.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyRecipes.length,
        itemBuilder: (context, index) {
          return RecipesCard(data: dummyRecipes[index], smallCard: true);
        },
      ),
    );
  }
}
