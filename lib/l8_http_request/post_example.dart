
import 'dart:async';
// Demo Phương thức post

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'album_model.dart';

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    print('Body chưa jsonDecode: ${response.body}');

    var rawData = jsonDecode(response.body);

    print('Raw data of body: $rawData');

    return Album.fromJsonForMethodPOST(rawData);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

// class Album {
//   final int id;
//   final String title;
//
//   const Album({required this.id, required this.title});
//
//// Kiểu tạo constructor dạng named constructor
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();    // _controller Là 1 biến state Dạng TextEditingController
  Future<Album>? _futureAlbum;      //? tức chấp nhận cho nó nhận giá trị null
                                    // _futureAlbum cũng là 1 state của widget này

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,    // Giá trị nhập vào sẽ được đưa vào biến state _controller
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);   //set state _futureAlbum sẽ nhận giá trị là  của hàm createAlbum(_controller.text)  trả về
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,     // _futureAlbum Là 1 biến hứng kết quả của 1 hành động bất đồng bộ Future<Album>
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          Album album = snapshot.data!;
          return Text('Response: title - ${album.title} , id - ${album.id}');
        }

        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}


