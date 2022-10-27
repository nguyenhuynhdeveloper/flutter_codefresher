import 'dart:convert';

import 'package:flutter/material.dart';
import '../components/album_item.dart';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    futureAlbum = fetchAlbum();
    super.initState();
  }

  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body);
      return (result as List).map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quản lý Album'),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Album> album = snapshot.data!;
                return ListView.builder(
                  itemCount: album.length,
                  itemBuilder: (context, index) {
                    var item = album[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20,
                      ),
                      child: AlbumItem(
                        imageUrl: item.thumbnailUrl,
                        title: 'id: ${item.id}',
                        subTitle: 'title: ${item.title}',
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
