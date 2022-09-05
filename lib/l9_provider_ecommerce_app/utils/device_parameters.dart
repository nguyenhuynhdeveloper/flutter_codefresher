import 'package:flutter/material.dart';

class DeviceParameters {
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;
}
