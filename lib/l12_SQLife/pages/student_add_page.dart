import 'package:flutter/material.dart';
import 'package:flutter_18/l12_SQLife/pages/home_page.dart';

import '../data/home_state.dart';
import '../models/student.dart';


class StudentAddPage extends StatelessWidget {
  const StudentAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name;
    String address;
    String phone;

    final _name = TextEditingController();
    final _address = TextEditingController();
    final _phone = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title:

        Text(
          'Thêm sinh viên' ,
          style: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.blue,
              fontWeight: FontWeight.bold),
        ),


        centerTitle: true,
        backgroundColor: Colors.yellow.shade600,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _name,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Fullname",

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _address,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Address",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _phone,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Phone",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                name = _name.text;
                address = _address.text;
                phone = _phone.text;
                homeState.sqLiteController.insertStudent(
                    Student(name: name, address: address, phone: phone));

               await  Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => const HomePage() ));
              },
              child:

              Text(
                'Lưu' ,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
