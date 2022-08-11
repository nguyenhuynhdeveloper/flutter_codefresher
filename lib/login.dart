import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Số thứ nhất'),
          const SizedBox(height: 20),
          const TextField(
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          const Text('Số thứ hai'),
          const SizedBox(height: 20),
          const TextField(
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 50),
          const Text('Kết quả'),
          const SizedBox(height: 10),
          TextButton(onPressed: () {}, child: const Text('Cộng'))
        ],
      ),
    );
  }
}