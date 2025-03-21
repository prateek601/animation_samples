import 'package:flutter/material.dart';

class EndlessScrollingWidget extends StatefulWidget {
  final double childrenWidth;
  final List<Widget> children;
  final Duration scrollDuration;
  const EndlessScrollingWidget({
    super.key,
    required this.childrenWidth,
    required this.children,
    required this.scrollDuration,
  });

  @override
  State<EndlessScrollingWidget> createState() => _EndlessScrollingWidgetState();
}

class _EndlessScrollingWidgetState extends State<EndlessScrollingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation =
      Tween<Offset>(begin: Offset.zero, end: Offset(-widget.childrenWidth, 0))
          .animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.scrollDuration,
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(),
      width: 500,
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent
          ], stops: [
            0.1,
            0.25,
            0.75,
            0.9
          ]).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Transform.translate(
          offset: animation.value,
          child: Row(children: widget.children),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String text;
  const CardWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
