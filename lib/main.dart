import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth_screen/auth_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(3, 37, 65, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const AuthWidget(),
    );
  }
}
