import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget initAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/logo.svg'),
        const SizedBox(width: 10),
        SvgPicture.asset('assets/images/heading.svg'),
      ],
    ),
  );
}
