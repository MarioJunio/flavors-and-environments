import 'package:flutter/material.dart';

class AppScaleAnimation extends StatelessWidget {
  final Animation<double> angle;
  final Widget child;

  const AppScaleAnimation({
    Key? key,
    required this.angle,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      builder: (context, child) {
        return Transform.scale(
          scale: angle.value,
          filterQuality: FilterQuality.high,
          child: child,
        );
      },
      child: child,
    );
  }
}
