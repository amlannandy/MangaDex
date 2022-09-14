import 'package:flutter/material.dart';

enum EButtonType {
  dark,
  light,
  primary,
}

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final EButtonType type;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const CustomIconButton({
    Key? key,
    required this.text,
    required this.icon,
    this.type = EButtonType.primary,
    this.onPressed,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size.width * 0.8, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        icon: Icon(icon),
        onPressed: isDisabled ? null : onPressed,
      ),
    );
  }
}
