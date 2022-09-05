//Buổi 1, 3, 5
import 'package:flutter/material.dart';   // import cách vẽ giao diện

// import các màn hình
import 'l1/flutter_demo.dart';


//import để khoá hướng màn hình
import 'package:flutter/services.dart';

//Điểm bắt đầu của ứng dụng
void main() {

  //Khoá hướng màn hình
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));

  runApp(const MyApp());   //class MyApp() là class sẽ được chạy . đây là root của chương trình
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(       // return  ra 1
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),   //Buổi 1

    );
  }
}


