import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextPresentationAnimation extends StatefulWidget {
  final String text;
  final Animation<double> controller;

  const AppTextPresentationAnimation({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  State<AppTextPresentationAnimation> createState() =>
      _AppTextPresentationAnimationState();
}

class _AppTextPresentationAnimationState
    extends State<AppTextPresentationAnimation> {
  late Animation<Offset> translateAnimation;
  late Animation<double> fadeOutAnimation;

  @override
  void initState() {
    super.initState();

    translateAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          1,
          curve: Curves.slowMiddle,
        ),
      ),
    );

    fadeOutAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.9,
          1,
          curve: Curves.linearToEaseOut,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) => _animateBuilder(context, child),
    );
  }

  Widget _animateBuilder(context, child) => Opacity(
        opacity: fadeOutAnimation.value,
        alwaysIncludeSemantics: true,
        child: Transform.translate(
          offset: translateAnimation.value,
          filterQuality: FilterQuality.high,
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      );
}
