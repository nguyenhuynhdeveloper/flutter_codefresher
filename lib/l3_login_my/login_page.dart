import 'package:flutter/material.dart';

import 'package:flutter_18/l5_StateFullWidget_my/list_view_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int firstNumber = 0;
  int secondNumber = 0;
  int result = 0;

  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100.0))),
            width: double.infinity,
            height: 200,
            child: SizedBox(
              height: 50,
              child: Image.asset(
                'assets/images/anh.jpeg',
                fit: BoxFit.fitHeight,
                width: 20,
                height: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('Số thứ nhất'),
                const SizedBox(height: 20),
                _input('Full Name', fullNameController),
                const SizedBox(height: 20),
                _input('Email', emailController),
                const SizedBox(height: 20),
                _input('Phone Number', phoneController),
                const SizedBox(height: 20),
                _input('Password', passController),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListviewPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    height: 40,
                    child: const Center(child: Text('SINGUP')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextField _input(
    String hintText,
    TextEditingController controller,
  ) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: _firstController,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        // prefixIcon: Icon(Icons.person),
        hintText: hintText,
        labelText: hintText,
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
