// lib/features/recipe/presentation/logic/nav_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);
final heartProvider = StateProvider<bool>((ref) => false);
final pageControllerProvider = Provider<PageController>(
  (ref) => PageController(),
);
