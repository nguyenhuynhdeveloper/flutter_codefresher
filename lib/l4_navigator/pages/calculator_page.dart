import 'package:flutter/material.dart'; //import kiểu vẽ giao diện

//import các biến số cố định
import '../constants/custom_colors.dart';

// import kiểu css sẽ dùng chứ không dùng inline
import '../styles/textbox_decoration.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);
  static String routeName = "CalculatorPage";        //Khai báo 1 biến tĩnh routeName để navigator màn hình

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();  // override lại cái hàm tạo state
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Đây biển thị là 1 biến state
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  late double firstNumber; //late là lời hứa sẽ gán giá trị sau
  late double secondNumber;
  double resultNumber = 0;      //Biến kết quả không phải là 1 state

  getValue() {
    //double.tryParse(_firstController.text)   : Là convert text sang số . nếu mà nó bằng null thì nhận giá trị số 0
    firstNumber = double.tryParse(_firstController.text) ?? 0;
    secondNumber = double.tryParse(_secondController.text) ?? 0;
  }

//setState(() {})  : chỉ làm 1 việc duy nhất là sẽ render lại màn hình
  sumCalculator() {
    setState(() {
      getValue();
      resultNumber = firstNumber + secondNumber;
    });
  }

  minusCalculator() {
    setState(() {
      getValue();
      resultNumber = firstNumber - secondNumber;
    });
  }

  multiCalculator() {
    setState(() {
      getValue();
      resultNumber = firstNumber * secondNumber;
    });
  }

  divideCalculator() {
    setState(() {
      getValue();
      resultNumber = firstNumber / secondNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.orangeColor,   // backgroundColor của toàn màn hình  // CustomColors là class màu mà tự định nghĩa.
      appBar: AppBar(
        title: const Text(
            'Calculator 2 number'), // Đây là cái tittle của cái tabbar
        centerTitle: true, //cho tittle ở giữa
        backgroundColor: Colors.transparent, //Background ở AppBar . Colors là class màu mặc định của Flutter
        elevation: 0, //Cao độ của AppBar
      ),
      body: Column(
        children: [
          const SizedBox(height: 70),  // mục đích tạo 1 khối chèn xuống
          const Text(
            'Số thứ nhất',
            style: TextStyle(color: Colors.white),   // Text có thuộc tính style : giá trị nhận hàm TextStyle ()
          ),
          const SizedBox(height: 20),
          Padding(         // Padding là 1 widget mà có thể chèn các khoảng trống vào các hướng của widget con
            padding: const EdgeInsets.symmetric(horizontal: 20),    // Chèn hướng horizontal là 20 px
            child: TextField(      //TextField là ô  nhập text
              keyboardType: TextInputType.number,   // Dạng bàn phím sẽ nhập
              controller: _firstController,   // Gán biến state _firstController vào controller
              decoration: TextBoxDecoration(hintText: 'Nhập số thứ nhất'),  // Thuộc tính decoration : TextBoxDecoration(hintText : "Đây là gợi ý nhập"
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            'Số thứ hai',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _secondController,
              decoration: TextBoxDecoration(hintText: 'Nhập số thứ hai'),
            ),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(   //widget ElevatedButton có method onPressed : function Để thể hiện 1 button
                onPressed: sumCalculator,
                child: const Text('Cộng'),    //Text là child của ElevatedButton
              ),
              ElevatedButton(
                onPressed: minusCalculator,
                child: const Text('Trừ'),
              ),
              ElevatedButton(
                onPressed: multiCalculator,
                child: const Text('Nhân'),
              ),
              ElevatedButton(
                onPressed: divideCalculator,
                child: const Text('Chia'),
              ),
            ],
          ),
          const SizedBox(height: 70),
          Text(
            'Kết quả: $resultNumber',       //hứng biến  resultNumber tính được
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}


