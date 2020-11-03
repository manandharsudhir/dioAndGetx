import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  final Widget child;
  final double startingTime;
  final double endingTime;

  OpacityAnimation({this.child, this.endingTime, this.startingTime});
  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _opactiyAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _opactiyAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
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
    return Opacity(opacity: _opactiyAnimation.value, child: widget.child);
  }
}
