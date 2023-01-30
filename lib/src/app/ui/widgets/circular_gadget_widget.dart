import 'package:flavors/src/app/ui/renders/circular_gadget_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class CircularGadgetWidget extends LeafRenderObjectWidget {
  CircularGadgetWidget({
    required this.thumbSize,
    required this.strokeColor,
    required this.strokeValueColor,
    required this.centerColor,
    this.strokeWidth = 30,
  });

  final double strokeWidth;
  final Color strokeColor;
  final Color strokeValueColor;
  final Color centerColor;
  final double thumbSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CircularGadgetRender(
      thumbSize: thumbSize,
      centerColor: centerColor,
      strokeColor: strokeColor,
      strokeValueColor: strokeValueColor,
      strokeWidth: strokeWidth,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant CircularGadgetRender renderObject) {
    renderObject.strokeColor = strokeColor;
    renderObject.strokeValueColor = strokeValueColor;
    renderObject.centerColor = centerColor;
    renderObject.thumbSize = thumbSize;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(ColorProperty("strokeColor", strokeColor));
    properties.add(ColorProperty("strokeValueColor", strokeValueColor));
    properties.add(ColorProperty("centerColor", centerColor));
    properties.add(DoubleProperty("thumbSize", thumbSize));
    properties.add(DoubleProperty("strokeWidth", strokeWidth));
  }
}
