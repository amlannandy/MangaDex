import 'package:flutter/material.dart';
import 'package:mangadex_mobile/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MangaDex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xfff26d5b),
          secondary: const Color(0xff5d5d5a),
          tertiary: const Color(0xfff5f5f5),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
