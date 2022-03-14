import 'package:flutter/material.dart';
import 'package:mangadex_mobile/screens/LoginScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MangaDex',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: const LoginScreen(),
    );
  }
}
