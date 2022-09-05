// commit cũ của thầy duy : dạy về Provider trong buổi 9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myData = MyModel();

    // return Provider<MyModel>(
    //   create: (context) => myData,
    //   child: (),
    // );

    return ChangeNotifierProvider<MyModel>(
      create: (BuildContext context) {
        return myData;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          backgroundColor: Colors.grey,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],

                //Cách 1:  render lại view dùng Consumer<MyModal>

                // child: Consumer<MyModel>(
                //   builder: (context, myModel, child) {
                //     return RaisedButton(
                //       child: Text('Do something'),
                //       onPressed: () {
                //         myModel.doSomething();
                //       },
                //     );
                //   },
                // ),

                //// builder tham số không nhất thiết phải viết là (context, myModel  child
                // child: Consumer<MyModel>(    // khi mà thông báo được lắng nghe thì các Consumer được render lại
                //                               // Consumer bên trong là 1 builder chứ không phải là child
                //   builder: (_ctx, _data, _child) {
                //     return ElevatedButton(
                //       onPressed: () {
                //         _data.doSomething();
                //       },
                //       child: Text('Click me!'),
                //     );
                //   },

                // // Không có chạy
                // child: ElevatedButton(
                //   onPressed: () {
                //     myData.doSomething();
                //   },
                //   child: Text('Click me!'),
                // ),

                // Cách 2 lấy dữ liệu trực tiếp dùng builder(BuildContext context) + Provider.of
                child: Builder(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                      onPressed: () {
                        //myData.doSomething();
                        MyModel data =
                            Provider.of<MyModel>(context, listen: false);
                        data.doSomething();
                      },
                      child: const Text('Click me!'),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  builder: (context, myModel, child) {
                    return Text(myModel.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  String text = "Hello";

  void doSomething() {
    if (text == "Hello")
      text = "World";
    else
      text = "Hello";

    notifyListeners();
  }
}
