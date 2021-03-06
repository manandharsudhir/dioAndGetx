import 'package:flutter/material.dart';

class TranslateYAnimation extends StatefulWidget {
  final Widget child;
  final double startingTime;
  final double endingTime;
  final double changeInY;

  TranslateYAnimation(
      {this.child, this.endingTime, this.startingTime, this.changeInY});
  @override
  _TranslateYAnimationState createState() => _TranslateYAnimationState();
}

class _TranslateYAnimationState extends State<TranslateYAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _translateYAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _translateYAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(widget.startingTime, widget.endingTime,
            curve: Curves.easeOut)))
      ..addListener(() => setState(() {}));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(
            0, _translateYAnimation.value * widget.changeInY, 0.0),
        child: widget.child);
  }
}
