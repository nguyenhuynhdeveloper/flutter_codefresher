import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = 15,
    this.color = Colors.white,
    this.borderShadow = false,
    this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double borderRadius;
  final Color? color;
  final bool borderShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: color,
        boxShadow: [
          if (borderShadow)
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
