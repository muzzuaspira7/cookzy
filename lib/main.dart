// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'core/theme/app_theme.dart';
// import 'core/widgets/custom_bottom_nav.dart';

// void main() {
//   runApp(
//     const ProviderScope(child: MyApp()), // ✅ this is MUST
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App',
//       // theme: AppTheme.lightTheme, // optional
//       home: CustomBottomNav(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:cookzy/core/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const CustomBottomNav(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(1.0)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
