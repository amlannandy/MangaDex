import 'package:flutter/material.dart';

import 'package:mangadex_mobile/screens/profile/local_widgets/not_authenticated.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotAuthenticated();
  }
}
