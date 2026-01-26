import 'package:flutter/material.dart';

/// Séparateur réutilisable horizontal ou vertical
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.axis = Axis.horizontal,
    this.thickness = 1.0,
    this.color = const Color(0xFFE0E0E0),
  });

  final Axis axis;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.horizontal) {
      return Container(
        height: thickness,
        color: color,
      );
    } else {
      return Container(
        width: thickness,
        color: color,
      );
    }
  }
}
