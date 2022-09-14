import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isObscure;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final IconData icon;
  final Function(String)? onChange;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.icon,
    this.onChange,
    this.isObscure = false,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showText = true;

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
      child: TextFormField(
        key: widget.key,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.grey,
        onChanged: widget.onChange,
        controller: widget.controller,
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
        obscureText: widget.isObscure ? _showText : widget.isObscure,
      ),
    );
  }
}
