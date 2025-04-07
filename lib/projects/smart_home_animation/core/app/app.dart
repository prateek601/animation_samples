import 'package:animation_samples/projects/smart_home_animation/core/theme/sh_theme.dart';
import 'package:animation_samples/projects/smart_home_animation/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          // debugShowCheckedModeBanner: false,
          title: 'TheFlutterWay Smart Home Animated App',
          theme: SHTheme.dark,
          home: const HomeScreen(),
        );
      },
    );
  }
}
