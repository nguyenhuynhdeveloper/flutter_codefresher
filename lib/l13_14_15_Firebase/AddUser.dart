import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  late CollectionReference users;

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: addUser,
              child: Text(
                "Add User",
              ),
            ),
            TextButton(
              onPressed: removeUser,
              child: Text(
                "Remove User",
              ),
            ),
            TextButton(
              onPressed: updateUserName,
              child: Text(
                "Set UserName",
              ),
            ),
            TextButton(
              onPressed: updateData2,
              child: Text(
                "Update Data 2",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateData2() {
    // Call the user's CollectionReference to add a new user

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc()
    //     .update({'8L6ZhmPEyaeQGfpbY8sy': 'abc'});

    return users
        .doc("Syoy3iNEqc4d9AFkrwEB")
        .update({
          'full_name': 'Ha Anh Tuan',
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateUserName() {
    // Call the user's CollectionReference to add a new user
    return users
        .doc("I3elRhNPadNmeV8W3zb6")
        .set({
          'full_name': 'Vu Tuan Long', // John Doe
          'company': 'Viettel', // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> removeUser() {
    // Call the user's CollectionReference to add a new user
    return users.doc("0hOGzO12wGzBHJfeLd0Y").delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
