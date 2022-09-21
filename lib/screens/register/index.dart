import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:mangadex_mobile/routing/application.dart';
import 'package:mangadex_mobile/utils/constants.dart';
import 'package:mangadex_mobile/utils/snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: REGISTER_URL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url != REGISTER_URL) {
              Application.router.navigateTo(context, '/login', replace: true);
              showSnackbar(
                context,
                'Account created successfully! Please login',
                ESnackBarType.success,
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.prevent;
          },
        ),
      ),
    );
  }
}
