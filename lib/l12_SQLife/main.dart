
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'data/home_state.dart';
import 'models/sqlite_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SQLiteController sqLiteController;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeState>(create: (context) => homeState),
      ],
      child: MaterialApp(
        title: 'SQLife',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomePage(),
      ),
    );
  }
}

