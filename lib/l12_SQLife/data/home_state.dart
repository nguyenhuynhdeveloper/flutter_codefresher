import 'package:flutter/material.dart';

import '../models/sqlite_controller.dart';
import '../models/student.dart';

class HomeState extends ChangeNotifier {   //Kế thừa từ ChangeNotifier của Provider
  List<Student> studentList = [];      // Khai báo 1 mảng List chứa danh sách các sinh viên
  SQLiteController sqLiteController;    // Khai báo 1 đối tượng từ sqLiteController từ Class SQLiteController

  HomeState({required this.studentList, required this.sqLiteController});


  void getListStudents() async {
    studentList.clear();
    studentList = await sqLiteController.students();
    notifyListeners();
  }

  void getListStudentsInitialize() async {
    await sqLiteController.initializeDatabase();
    getListStudents();
    notifyListeners();
  }
}

final homeState =  HomeState(studentList: <Student>[], sqLiteController: SQLiteController());   // Tạo ra 1 đối tượng homeState để quản lý state của app
