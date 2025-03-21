import 'package:animation_samples/app/home_screen.dart';
import 'package:animation_samples/projects/card_hover_animation/card_hover_screen.dart';
import 'package:animation_samples/projects/endless_scrolling_tutorial/endless_scrolling_screen.dart';
import 'package:animation_samples/projects/radar_animation/radar_animation_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/card_hover':
      return MaterialPageRoute(builder: (_) => CardHoverScreen());
    case '/endless-scrolling':
      return MaterialPageRoute(builder: (_) => EndlessScrollingScreen());
    case '/radar-animation':
      return MaterialPageRoute(builder: (_) => RadarAnimationScreen());
    default:
      return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
