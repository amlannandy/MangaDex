import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mangadex_mobile/widgets/icon_button.dart';
import 'package:mangadex_mobile/widgets/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg'),
                const SizedBox(width: 20),
                SvgPicture.asset('assets/images/heading.svg'),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Enter username/email',
              labelText: 'Username/Email',
              errorText: '',
              validator: () {},
              onSaved: () {},
              controller: _userController,
              icon: LineIcons.user,
            ),
            CustomTextFormField(
              hintText: 'Enter password',
              labelText: 'Password',
              errorText: '',
              validator: () {},
              onSaved: () {},
              controller: _userController,
              icon: LineIcons.lock,
            ),
            CustomIconButton(
              icon: LineIcons.checkCircle,
              text: 'Login',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
