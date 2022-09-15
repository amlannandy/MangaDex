import 'package:flutter/material.dart';

class CustomLoadingSpinner extends StatelessWidget {
  final double size;

  const CustomLoadingSpinner({Key? key, this.size = 125}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Image.asset(
          "assets/images/spinner.gif",
          height: size,
          width: size,
        ),
      ),
    );
  }
}
