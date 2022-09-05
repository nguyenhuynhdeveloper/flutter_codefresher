import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar({
  String title = '',
  Widget? leading,
  List<Widget>? action,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.blue,
    centerTitle: true,
    title: Text(title),
    leading: leading,
    actions: action,
  );
}
