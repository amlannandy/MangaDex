import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

import 'package:mangadex_mobile/routing/application.dart';
import 'package:mangadex_mobile/widgets/icon_button.dart';

class NotAuthenticated extends StatelessWidget {
  const NotAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Oops! Looks like no user is signed in currently!",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomIconButton(
          text: 'Login',
          icon: LineIcons.userShield,
          onPressed: () => Application.router.navigateTo(context, "/login"),
        ),
        CustomIconButton(
          text: 'Register',
          icon: LineIcons.userPlus,
          onPressed: () => Application.router.navigateTo(context, "/register"),
        ),
      ],
    );
  }
}
