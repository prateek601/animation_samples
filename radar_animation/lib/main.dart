import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CustomPaint(
                  painter: ConcentricCirclePainter(),
                ),
                CustomPaint(
                  painter: LinePainter(),
                ),
                const RadarBeam()
              ],
            ),
          )),
    );
  }
}

class RadarBeam extends StatefulWidget {
  const RadarBeam({super.key});

  @override
  State<RadarBeam> createState() => _RadarBeamState();
}

class _RadarBeamState extends State<RadarBeam>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Colors.transparent,
              Color(0xFF34A853),
              Colors.transparent
            ],
            stops: [0.2, 0.25, 0.25],
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // double radius = 40;

    double angle = 0;
    double r = 300; // radius

    Path path = Path();

    for (int i = 0; i <= 9; i++) {
      path
        ..moveTo(size.width / 2, size.height / 2)
        ..lineTo(size.width / 2 + (r * cos(angle * (pi / 180))),
            size.height / 2 + (r * sin(angle * (pi / 180))));
      angle += 36;
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ConcentricCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    double radius = 50;

    for (int i = 0; i <= 5; i++) {
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
      radius += 50;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
