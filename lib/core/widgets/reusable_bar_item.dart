import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../constants/colors.dart';

BottomBarItem buildBarItem({
  required int index,
  required int selected,
  required String icon,
  required String selectedIcon,
  Color selectedColor = AppColors.button,
  Color unSelectedColor = Colors.grey,
  String? label,
}) {
  return BottomBarItem(
    icon: Image.asset(icon, color: unSelectedColor, width: 25.w),
    selectedIcon: Image.asset(selectedIcon, color: selectedColor, width: 25.w),
    selectedColor: selectedColor,
    unSelectedColor: unSelectedColor,
    title: const SizedBox.shrink(),
  );
}
