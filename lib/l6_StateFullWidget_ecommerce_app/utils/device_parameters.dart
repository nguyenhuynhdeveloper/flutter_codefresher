import 'package:flutter/material.dart';

class DeviceParameters {
  static double screenWidth(context) => MediaQuery.of(context).size.width;      // Lấy chiều rộng màn hình của thiết bị
  static double screenHeight(context) => MediaQuery.of(context).size.height;    // Lấy chiều cao màn hình của thiết bị
}
