import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularGadgetRender extends RenderBox {
  Color _strokeColor;
  Color _strokeValueColor;
  Color _centerColor;
  double _thumbSize;
  double _strokeWidth;

  CircularGadgetRender({
    required Color strokeColor,
    required Color strokeValueColor,
    required Color centerColor,
    required double thumbSize,
    required double strokeWidth,
  })  : _strokeColor = strokeColor,
        _strokeValueColor = strokeValueColor,
        _centerColor = centerColor,
        _thumbSize = thumbSize,
        _strokeWidth = strokeWidth;

  Color get strokeColor => _strokeColor;

  set strokeColor(Color value) {
    if (_strokeColor != value) {
      _strokeColor = value;
      markNeedsPaint();
    }
  }

  Color get strokeValueColor => _strokeValueColor;

  set strokeValueColor(Color value) {
    if (_strokeValueColor != value) {
      _strokeValueColor = value;
      markNeedsPaint();
    }
  }

  Color get centerColor => _centerColor;

  set centerColor(Color value) {
    if (_centerColor != value) {
      _centerColor = value;
      markNeedsPaint();
    }
  }

  double get thumbSize => _thumbSize;

  set thumbSize(double value) {
    if (_thumbSize != value) {
      _thumbSize = value;
      markNeedsPaint();
    }
  }

  double get strokeWidth => _strokeWidth;

  set strokeWidth(double value) {
    if (_strokeWidth != value) {
      _strokeWidth = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    final desiredWidth = thumbSize;
    final desiredHeight = thumbSize;

    final desiredSize = Size(desiredWidth, desiredHeight);

    size = constraints.constrain(desiredSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    canvas.save();

    canvas.translate(offset.dx, offset.dy);

    const Offset arcOffset = Offset(0, 0);
    const double radius = 29;
    const double radiusOffset = radius / 2;

    final paintArcStroke = Paint()
      ..color = _strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;

    _drawArc(
      canvas,
      arcOffset,
      Size(_thumbSize, _thumbSize),
      paintArcStroke,
      90.0,
      360.0,
    );

    final paintArcStrokeAchieved = Paint()
      ..color = _strokeValueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;

    _drawArc(
      canvas,
      arcOffset,
      size,
      paintArcStrokeAchieved,
      90.0,
      130.0,
    );

    final paintArcFill = Paint()
      ..color = _centerColor
      ..style = PaintingStyle.fill;

    _drawArc(
      canvas,
      const Offset(radiusOffset, radiusOffset),
      Size(_thumbSize - radius, _thumbSize - radius),
      paintArcFill,
      90.0,
      360.0,
    );
  }

  void _drawArc(Canvas canvas, Offset offset, Size size, Paint paint,
      startAngle, fillAngle) {
    canvas.drawArc(
      offset & size,
      _toRadians(startAngle),
      _toRadians(fillAngle),
      false,
      paint,
    );
  }

  double _toRadians(double degree) => (degree / 180) * math.pi;
}
