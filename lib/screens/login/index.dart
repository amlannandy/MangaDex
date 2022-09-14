import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mangadex_mobile/api/repository.dart';
import 'package:mangadex_mobile/routing/application.dart';
import 'package:mangadex_mobile/utils/common.dart';
import 'package:mangadex_mobile/utils/snackbar.dart';
import 'package:mangadex_mobile/widgets/icon_button.dart';
import 'package:mangadex_mobile/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _repository = Repository();

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoginDisabled = true;
  void _onInputChange(String? value) => setState(() => _isLoginDisabled =
      _userController.text.isEmpty || _passwordController.text.isEmpty);

  void _onLoginSubmit() async {
    final isEmailProvided = isEmail(_userController.text);
    final username = isEmailProvided ? null : _userController.text;
    final email = isEmailProvided ? _userController.text : null;
    final password = _passwordController.text;
    try {
      final response = await _repository.login(email, username, password);
      print(response);
    } catch (e) {
      showSnackbar(context, e.toString(), ESnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => Application.router.pop(context),
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
            CustomTextField(
              labelText: 'Username/Email',
              icon: LineIcons.user,
              controller: _userController,
              onChange: _onInputChange,
            ),
            CustomTextField(
              labelText: 'Password',
              icon: LineIcons.lock,
              controller: _passwordController,
              isObscure: true,
              onChange: _onInputChange,
            ),
            CustomIconButton(
              icon: LineIcons.checkCircle,
              text: 'Login',
              onPressed: _onLoginSubmit,
              isDisabled: _isLoginDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
