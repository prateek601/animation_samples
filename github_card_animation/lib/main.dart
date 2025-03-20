import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double rotateX = 0.0;
  double rotateY = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: SizedBox(
          height: 250,
          width: 600,
          child: LayoutBuilder(builder: (context, constraints) {
            print(constraints.maxWidth);
            print(constraints.maxHeight);
            return MouseRegion(
              onHover: (event) {
                double cardWidth = constraints.maxWidth;
                double cardHeight = constraints.maxHeight;
                double deltaX = event.localPosition.dx;
                double deltaY = event.localPosition.dy;

                setState(() {
                  rotateX = deltaX / cardWidth - 0.5;
                  rotateY = deltaY / cardHeight - 0.5;
                });
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(rotateY * 3 * pi / 180)
                  ..rotateY(rotateX * 3 * pi / 180),
                child: ColoredBox(color: Colors.black),
              ),
            );
          }),
        ),
      )),
    );
  }
}
