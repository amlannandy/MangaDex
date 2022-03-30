import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mangadex_mobile/screens/init/index.dart';
import 'package:mangadex_mobile/screens/login_screen.dart';

var initHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const InitScreen();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LoginScreen();
});
