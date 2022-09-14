import 'package:flutter/material.dart';

enum ESnackBarType { error, success, info, warning }

Color _getBackgroundColor(ESnackBarType type) {
  switch (type) {
    case ESnackBarType.error:
      return const Color(0xfff85959);
    case ESnackBarType.info:
      return const Color(0xff88bef5);
    case ESnackBarType.success:
      return const Color(0xff17b978);
    case ESnackBarType.warning:
      return const Color(0xffeac100);
    default:
      return Colors.black87;
  }
}

Color _getIconOrTextColor(ESnackBarType type) {
  switch (type) {
    case ESnackBarType.error:
    case ESnackBarType.info:
    case ESnackBarType.success:
    case ESnackBarType.warning:
      return Colors.white70;
    default:
      return Colors.white;
  }
}

IconData _getIcon(ESnackBarType type) {
  switch (type) {
    case ESnackBarType.error:
      return Icons.error_outline_rounded;
    case ESnackBarType.info:
      return Icons.info_outline_rounded;
    case ESnackBarType.warning:
      return Icons.warning_rounded;
    case ESnackBarType.success:
      return Icons.check_circle_outline_rounded;
    default:
      return Icons.info_outline_rounded;
  }
}

void showSnackbar(BuildContext context, String text, ESnackBarType type) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Icon(
          _getIcon(type),
          color: _getIconOrTextColor(type),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: _getIconOrTextColor(type),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
    backgroundColor: _getBackgroundColor(type),
  ));
}
