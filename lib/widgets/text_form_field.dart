import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String errorText;
  final bool isObscure;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final Function validator;
  final Function onSaved;
  final TextEditingController controller;
  final IconData icon;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.errorText,
    required this.validator,
    required this.onSaved,
    required this.controller,
    required this.icon,
    this.isObscure = false,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.center,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: widget.labelText,
          icon: Icon(
            widget.icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          border: InputBorder.none,
          suffixIcon: widget.isObscure
              ? GestureDetector(
                  onTap: () => setState(() => _showText = !_showText),
                  child: Icon(
                    _showText ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: Colors.black45,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
