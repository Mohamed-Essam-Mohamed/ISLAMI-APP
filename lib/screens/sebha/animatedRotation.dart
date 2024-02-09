import 'package:flutter/material.dart';

class AnimatedSebha extends StatefulWidget {
  @override
  State<AnimatedSebha> createState() => _AnimatedSebhaState();
  String imageTop;
  String imageBottom;
  Function onClick;
  AnimatedSebha(
      {required this.imageBottom,
      required this.imageTop,
      required this.onClick});
}

class _AnimatedSebhaState extends State<AnimatedSebha> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100, top: 40),
          child: Image.asset(
            '${widget.imageTop}',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() => turns += 1 / 99);
              widget.onClick();
            },
            child: AnimatedRotation(
              turns: turns,
              duration: Duration(seconds: 1),
              child: Image.asset(
                '${widget.imageBottom}',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
