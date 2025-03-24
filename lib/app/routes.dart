import 'package:animation_samples/app/home_screen.dart';
import 'package:animation_samples/projects/card_hover_animation/card_hover_screen.dart';
import 'package:animation_samples/projects/endless_scrolling_tutorial/endless_scrolling_screen.dart';
import 'package:animation_samples/projects/radar_animation/radar_animation_screen.dart';
import 'package:animation_samples/projects/vice_slide_animations/features/home/presentation/screens/vice_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.home:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case RouteName.cardHover:
      return MaterialPageRoute(builder: (_) => CardHoverScreen());
    case RouteName.endlessScrolling:
      return MaterialPageRoute(builder: (_) => EndlessScrollingScreen());
    case RouteName.radarAnimation:
      return MaterialPageRoute(builder: (_) => RadarAnimationScreen());
    case RouteName.viceSlideAnimation:
      return MaterialPageRoute(builder: (_) => ViceScreen());
    default:
      return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}

class RouteName {
  RouteName._();
  static const String home = '/';
  static const String cardHover = '/card_hover';
  static const String endlessScrolling = '/endless-scrolling';
  static const String radarAnimation = '/radar-animation';
  static const String viceSlideAnimation = '/vice-slide-animation';
}