import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularGadgetRender extends RenderBox {
  final double startAngle = 90;
  final double fullAngle = 360;

  Color _strokeColor;
  Color _strokeValueColor;
  Color _centerColor;
  double _strokeWidth;
  double _min, _max;
  double _value;

  CircularGadgetRender({
    required Color strokeColor,
    required Color strokeValueColor,
    required Color centerColor,
    required double strokeWidth,
    required double min,
    required double max,
    required double value,
  })  : _strokeColor = strokeColor,
        _strokeValueColor = strokeValueColor,
        _centerColor = centerColor,
        _strokeWidth = strokeWidth,
        _min = min,
        _max = max,
        _value = value;

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

  double get strokeWidth => _strokeWidth;

  set strokeWidth(double value) {
    if (_strokeWidth != value) {
      _strokeWidth = value;
      markNeedsPaint();
    }
  }

  double get min => _min;

  set min(double value) {
    if (_min != value) {
      _min = value;
      markNeedsPaint();
    }
  }

  double get max => _max;

  set max(double value) {
    if (_max != value) {
      _max = value;
      markNeedsPaint();
    }
  }

  double get value => _value;

  set value(double value) {
    if (_value != value) {
      _value = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    canvas.translate(offset.dx, offset.dy);

    const Offset arcOffset = Offset(0, 0);
    final Offset arcCenterOffset = Offset(strokeWidth / 2, strokeWidth / 2);

    final paintArcStroke = Paint()
      ..color = _strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;

    _drawArc(
      canvas,
      arcOffset,
      size,
      paintArcStroke,
      startAngle,
      fullAngle,
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
      startAngle,
      _currentValue,
    );

    final paintArcFill = Paint()
      ..color = _centerColor
      ..style = PaintingStyle.fill;

    _drawArc(
      canvas,
      arcCenterOffset,
      Size(size.width - strokeWidth, size.height - strokeWidth),
      paintArcFill,
      fullAngle,
      fullAngle,
    );

    canvas.save();
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

  double get _currentValue => (value - min) / _maxUnitValue;

  double get _maxUnitValue => (max - min) / fullAngle;

  double _toRadians(double degree) => (degree / 180) * math.pi;
}
