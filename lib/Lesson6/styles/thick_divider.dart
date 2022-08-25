import 'package:flutter/material.dart';

class ThickDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double padding;
  final double height;

  const ThickDivider({
    Key? key,
    this.color = const Color.fromARGB(255, 247, 94, 5),
    this.thickness = 2,
    this.padding = 5,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      endIndent: padding,
      indent: padding,
      height: height,
    );
  }
}
