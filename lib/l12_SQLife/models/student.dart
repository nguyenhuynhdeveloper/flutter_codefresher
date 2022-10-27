import 'package:flutter/material.dart';

class Student {
  int? id;
  String name;
  String address;
  String phone;

  Student(
      {this.id,
      required this.name,
      required this.address,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }
}
