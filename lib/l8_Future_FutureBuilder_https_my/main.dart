import 'package:flutter/material.dart';

import 'dart:async'; // Để chạy bất đồng bộ
import 'dart:convert'; // Để convert json sang object thuần  sử dụng method jsonDecode()

import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; //Gói thư viện  từ pub.dev và đổi tên nó thành http cho tiện sử dụng

// import 'album_model.dart';
class Album {
   final int albumId;
   final int id;
   final String title;
   final String url;
   final String thumbnailUrl;

  const Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  static Album fromJson(Map<String, dynamic> json) {
    return Album(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}

// Đây là class xử lý tác vụ  bất đồng bộ . đây là 1 class của Dart
Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  print('Body: ${response.body}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var rawData = jsonDecode(response.body);

    print('Raw data of body: $rawData');
    return Album.fromJson(rawData); // Cái này chính là return ra 1 Album
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album>
      futureAlbum; // khai báo 1 biến futureAlbum và hứa sẽ gán giá trị sau

//Đây là vòng đời : khởi tạo giá trị state
  @override
  void initState() {
    super.initState();
    futureAlbum =
        fetchAlbum(); // fetchAlbum() chính là 1 hàm mà sẽ trả ra  1 đối tượng Album
  }

  //Đây là vòng đời : Render ra view
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future:
                futureAlbum, //future chính là nơi nhận data của widget FutureBuilder<Album>
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Nếu Future trả về 1 kết quả value
                Album album = snapshot.data!;
                return Text(album.title);
              } else if (snapshot.hasError) {
                // Nếu Future trả về 1 error
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator(); //Xoay tròn sẽ hiện ra khi ở trạng thái đợi
            },
          ),
        ),
      ),
    );
  }
}
