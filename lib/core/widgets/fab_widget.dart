// lib/core/widgets/custom_fab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/logic/nav_controller.dart';

class CustomFAB extends ConsumerWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heart = ref.watch(heartProvider);
    return FloatingActionButton(
      onPressed: () {
        ref.read(heartProvider.notifier).state = !heart;
      },
      backgroundColor: Colors.black,
      shape: const CircleBorder(), // ✅ Clean circular shape
      // child: Icon(
      //   heart ? FontAwesomeIcons.utensils: CupertinoIcons.heart,
      //   color: Colors.red,
      // ),
      child: Image.asset(
        'assets/icons/chef.png',
        color: Colors.white,
        width: 20,
      ),
    );
  }
}
