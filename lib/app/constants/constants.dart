import 'package:animation_samples/app/models/project.dart';
import 'package:animation_samples/app/routes.dart';

List<Project> projects = [
  Project(
      title: "Card Hover Animation",
      description: "See the beautiful hover animation",
      route: RouteName.cardHover),
  Project(
      title: "Endless scrolling",
      description: "See the endless scrolling in motion",
      route: RouteName.endlessScrolling),
  Project(
      title: "Radar animation",
      description: "check out the radial gradient used to make this animation",
      route:RouteName.radarAnimation),
  Project(
      title: "Vice Slide Animation",
      description: "Stunning slide animations",
      route: RouteName.viceSlideAnimation),
  Project(
      title: "Smart Home Animation",
      description:
          "Parallax effect, implicit animation and custom hero transition",
      route: RouteName.smartHomeAnimation),
];
