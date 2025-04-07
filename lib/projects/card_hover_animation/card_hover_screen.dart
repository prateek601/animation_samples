import 'dart:ui';

import 'package:flutter/material.dart';

class CardHoverScreen extends StatefulWidget {
  const CardHoverScreen({super.key});

  @override
  State<CardHoverScreen> createState() => _CardHoverScreenState();
}

class _CardHoverScreenState extends State<CardHoverScreen>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: MouseRegion(
            onEnter: (_) {
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
                    borderRadius: BorderRadius.circular(20),
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
                          padding: const EdgeInsets.all(20.0),
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
                SizedBox(
                  width: 230,
                  height: 350,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 8),
                      borderRadius: BorderRadius.circular(20),
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
