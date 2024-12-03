import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: MouseRegion(
            onEnter: (_) {
              print("hover");
              setState(() {
                isHovering = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovering = false;
              });
            },
            child: Stack(
              children: [
                Container(
                  height: 350,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/27951997/pexels-photo-27951997/free-photo-of-a-laptop-on-a-table-with-a-vase-of-flowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1000),
                  left: isHovering ? 0 : 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.hardEdge,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 350,
                        width: 230,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                  "This is the image of a laptop kept on a table"),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                  "Now as you can see this image it is a good practise to keep it aside. Generally speaking I love the way it is kept. Nevetheless it is awesome."),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}