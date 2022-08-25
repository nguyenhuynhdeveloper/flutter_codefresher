import 'package:flutter/material.dart';

class TextFormBox extends StatelessWidget {
  const TextFormBox({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.decoration,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    this.obscureText = false,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry padding;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        decoration: decoration,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}
