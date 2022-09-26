import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:mangadex_mobile/routing/application.dart';
import 'package:mangadex_mobile/routing/routes.dart';
import 'package:mangadex_mobile/screens/init/state/auth_state.dart';

void main() => runApp(MangaDexApp());

class MangaDexApp extends StatelessWidget {
  MangaDexApp({Key? key}) : super(key: key) {
    final router = FluroRouter();
    Routes.configureRouter(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthState>(
      create: (BuildContext context) => AuthState(),
      child: MaterialApp(
        title: 'MangaDex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xfff26d5b),
            secondary: const Color(0xff5d5d5a),
            tertiary: const Color(0xfff5f5f5),
          ),
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
