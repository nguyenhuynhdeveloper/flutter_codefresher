import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.textColor,
    this.fontWeight,
    this.textOverflow,
    this.textAlign,
    this.lineThrough = false,
  }) : super(key: key);
  final String text;
  final double? size;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: fontWeight,
        overflow: textOverflow,
        decoration: TextDecoration.combine([
          if (lineThrough) TextDecoration.lineThrough,
        ]),
      ),
      textAlign: textAlign,
    );
  }
}
