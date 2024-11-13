import 'dart:math';

import 'package:endless_scrolling_tutorial/endless_scrolling_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final children = [
    CardWidget(text: "Flutter"),
    CardWidget(text: "IOS"),
    CardWidget(text: "Android"),
    CardWidget(text: "Firebase"),
    CardWidget(text: "Git"),
    CardWidget(text: "Programming"),
    CardWidget(text: "Flutter"),
    CardWidget(text: "IOS"),
    CardWidget(text: "Android"),
    CardWidget(text: "Firebase"),
    CardWidget(text: "Git"),
    CardWidget(text: "Programming"),
  ];

  final imageChildren = [
    for (int i = 0; i < 8; i++)
      SizedBox(
          height: 200,
          width: 155,
          child: Image.network(
              "https://picsum.photos/150/200?rnd=${Random().nextInt(100)}"))
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(100, 80, 10, 27),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EndlessScrollingWidget(
              children: children,
              childrenWidth: 435,
              scrollDuration: Duration(seconds: 8),
            ),
            SizedBox(
              height: 10,
            ),
            EndlessScrollingWidget(
              children: imageChildren,
              childrenWidth: 435,
              scrollDuration: Duration(seconds: 20),
            ),
          ],
        )),
      ),
    );
  }
}
