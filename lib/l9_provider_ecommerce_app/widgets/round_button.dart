import 'package:flutter/material.dart';
import 'custom_container.dart';
import 'custom_text.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.borderRadius = 15,
    this.buttonColor,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    this.textColor,
  }) : super(key: key);

  final double borderRadius;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final String text;
  final Color? textColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomContainer(
        borderRadius: borderRadius,
        color: buttonColor,
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: CustomText(
            text: text,
            textAlign: TextAlign.center,
            textColor: textColor,
          ),
        ),
      ),
    );
  }
}
