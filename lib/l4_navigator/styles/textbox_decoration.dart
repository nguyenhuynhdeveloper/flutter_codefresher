import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
InputDecoration TextBoxDecoration({
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  Color? fillColor = Colors.white54,
}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    prefixIcon: prefixIcon,
    filled: true,
    fillColor: fillColor,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    contentPadding: const EdgeInsets.all(20),
  );
}
