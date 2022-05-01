import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mangadex_mobile/screens/home/state/home_bloc.dart';
import 'package:mangadex_mobile/screens/init/index.dart';
import 'package:mangadex_mobile/screens/login/index.dart';
import 'package:provider/provider.dart';

var initHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MultiProvider(
    providers: [
      Provider<HomeBloc>(
        create: (context) => HomeBloc(),
        dispose: (context, bloc) => bloc.dispose(),
      ),
    ],
    child: const InitScreen(),
  );
});

var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LoginScreen();
});
