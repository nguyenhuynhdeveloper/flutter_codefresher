import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../data/home_state.dart';
import '../models/student.dart';


class StudentEditPage extends StatelessWidget {
  int id;
  String name;
  String address;
  String phone;

  StudentEditPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.address,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String studentName = name;
    String studentAddress = address;
    String studentPhone = phone;

    final _name = TextEditingController();
    final _address = TextEditingController();
    final _phone = TextEditingController();

    _name.text = studentName;
    _address.text = studentAddress;
    _phone.text = studentPhone;
    return Scaffold(
      appBar: AppBar(
        title:

        Text(
          'Chỉnh sửa sinh viên' ,
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
                border: InputBorder.none,
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
                homeState.sqLiteController.updateStudent(Student(
                    id: id, name: name, address: address, phone: phone));

                await  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const HomePage() ));
              },
              child:  Text(
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
