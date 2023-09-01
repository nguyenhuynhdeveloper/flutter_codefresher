import 'package:buoi1/can_not_fly_exception.dart';
import 'package:buoi1/developer.dart';
import 'package:buoi1/operation_system_type.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // khai bao biến
  // kiểu_dữ_liệu tên biến
  int a = 0;
  int? b;
  late int c;
  double d = 0;
  String e = '';
  var g = 5;
  final int f = 10;

  int _counter = 0;

  static const MACHINE_TYPE = 10;

  void _incrementCounter() {
    var person1 = Developer(name: 'hoan', address: 'HN', age: 30);
    print(
        'hoan.dv: person1: name is ${person1.name}, with addesss = ${person1.address},with age = ${person1.age}');

    var person2 = Developer(address: 'ND', name: 'Duy', age: 25);

    print(
        'hoan.dv: person2: name is ${person2.name}, with address = ${person2.address},with age = ${person2.age}');

    var person3 = Developer(name: 'tai', address: 'HD', age: 24);

    var person4 = Developer(name: 'Luật', age: 20, address: '');
    print('hoan.dv: person4: ${person4.name}, ${person4.address}');

    var dev = Developer(name: 'H', age: 20, address: 'HN');

    dev.flirting();

    var qd = dev.run(10);
    print('hoan.dv: km is run: ${dev.quangduong} - $qd ');

    // exception
    try {
      dev.fly();
    } on CanNotFlyException catch (_, e) {
      print(e.toString());
    } on Exception catch (_, e) {}

    // enum
    var machineType = OperationSystemType.LINUX;

    // Biến kiểu dynamic có thể gán lại giá trị bất kỳ 
    dynamic x;
    x = 10;
    x = 'This is dynamic variable';

    print('tag: Nội dung log mình muốn log ra/xem');
    print('hoan.dv: a = $a, b = $b');

    int h = 5;

    // điều kiện rẽ nhánh
    if (h < 10) {
      print('hoan.dv: h have a digit');
    } else {
      print('hoan.dv: h has more than a digit');
    }

    String i = 'hoan';

    switch (i) {
      case 'duy':
        print('hoan.dv: Mr Duy');
        break;
      case 'hoan':
        print('hoan.dv: hoan');
        break;
    }

    // vòng lặp
    int j = 0;
    for (j = 0; j < 20; j++) {
      print('hoan.dv: j = ${j + 5}');
    }

    while (j < 20) {
      print('hoan.dv: j in while $j');
      j++;
    }

    do {
      j++;
    } while (j < 30);

    // toán tử
    double k = 10;
    int l = 5;
    // >, <, >=, <=, ==
    if (k == l) {}
    k += 2; // k = k + 2
    k -= 3;
    k *= 5;
    k /= 2;

    // cấu trúc dữ liệu: List, Map, Set

    var intArr = List<int>.filled(5, 0);
    intArr[0] = 1; // thêm phần tử
    intArr[0]; // truy cập phần tử
    // intArr.removeAt(0); // xóa phần tử

    for (int m = 0; m < intArr.length; m++) {
      print('hoan.dv: loop in for, m = ${intArr[m]}');
    }

    var intArr1 = [];
    intArr1.add(5);
    intArr1.add('hoan');

    intArr1.forEach((element) {
      print('hoan.dv: in for each $element');
    });

    var intArr2 = [1, 2, 3];

    // map
    var map = <String, dynamic>{'name': 'hoan', 'age': 30};

    // set : là 1 list các phần tử không trùng nhau 
    var set = Set();

    set.add(1);
    set.add(2);
    set.add(3);
    set.add(1);

    set.forEach((element) {
      print('hoan.dv: for in set: $element');
    });

    // exception:
    // setState này nằm trong hàm _incrementCounter: Call khi bấm vào floatingbuton
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
