import 'package:flavors/src/app/ui/renders/circular_gadget_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class CircularGadgetWidget extends LeafRenderObjectWidget {
  CircularGadgetWidget({
    required this.strokeWidth,
    required this.strokeColor,
    required this.strokeValueColor,
    required this.centerColor,
    required this.min,
    required this.max,
    required this.value,
  });

  final double strokeWidth;
  final Color strokeColor;
  final Color strokeValueColor;
  final Color centerColor;
  final double min, max, value;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CircularGadgetRender(
      centerColor: centerColor,
      strokeColor: strokeColor,
      strokeValueColor: strokeValueColor,
      strokeWidth: strokeWidth,
      max: max,
      min: min,
      value: value,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant CircularGadgetRender renderObject) {
    renderObject.strokeColor = strokeColor;
    renderObject.strokeValueColor = strokeValueColor;
    renderObject.centerColor = centerColor;
    renderObject.min = min;
    renderObject.max = max;
    renderObject.value = value;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(ColorProperty("strokeColor", strokeColor));
    properties.add(ColorProperty("strokeValueColor", strokeValueColor));
    properties.add(ColorProperty("centerColor", centerColor));
    properties.add(DoubleProperty("strokeWidth", strokeWidth));
    properties.add(DoubleProperty("min", min));
    properties.add(DoubleProperty("max", max));
    properties.add(DoubleProperty("value", value));
  }
}
