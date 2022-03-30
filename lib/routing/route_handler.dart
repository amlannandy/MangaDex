import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mangadex_mobile/screens/home_screen.dart';
import 'package:mangadex_mobile/screens/login_screen.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomeScreen();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LoginScreen();
});
