import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../features/logic/nav_controller.dart';
import '../../features/presentation/home/home_screen.dart';
import '../../features/presentation/search/search_page.dart';
import 'app_text.dart';
import 'fab_widget.dart';
import 'reusable_bar_item.dart';

class CustomBottomNav extends ConsumerWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedIndexProvider);
    final pages = [
      const HomeScreen(),
      const SearchPage(),
      Container(
        child: Center(
          child: AppText(text: "Notification", fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        child: Center(
          child: AppText(text: "Profile", fontWeight: FontWeight.bold),
        ),
      ),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(iconStyle: IconStyle.animated),
        items: [
          buildBarItem(
            index: 0,
            selected: selected,
            icon: "assets/icons/home.png",
            selectedIcon: "assets/icons/home-active.png",
            label: 'Home',
          ),
          buildBarItem(
            index: 0,
            selected: selected,
            icon: "assets/icons/search.png",
            selectedIcon: "assets/icons/search.png",
            label: 'Home',
          ),

          buildBarItem(
            index: 0,
            selected: selected,
            icon: "assets/icons/notification.png",
            selectedIcon: "assets/icons/notification-active.png",
            label: 'Home',
          ),

          buildBarItem(
            index: 0,
            selected: selected,
            icon: "assets/icons/user.png",
            selectedIcon: "assets/icons/user-active.png",
            label: 'Home',
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.circle,
        onTap: (index) {
          if (index == selected) return;
          ref.read(selectedIndexProvider.notifier).state = index;
        },
      ),
      floatingActionButton: const CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[selected],
    );
  }
}
