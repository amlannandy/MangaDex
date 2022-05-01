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

  const CustomIconButton({
    Key? key,
    required this.text,
    required this.icon,
    this.type = EButtonType.primary,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 40,
        minWidth: 150,
        maxWidth: 300,
      ),
      child: ElevatedButton.icon(
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
