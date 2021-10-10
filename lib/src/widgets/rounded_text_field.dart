import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final Function(String?) onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String hintText;
  final bool autoFocus;
  final bool obscureText;
  const RoundedTextField({
    required this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.hintText = '',
    this.autoFocus = false,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      autofocus: autoFocus,
      obscureText: obscureText,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,

      // cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2.0),
            borderRadius: BorderRadius.zero),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.zero,
        ),
        hintText: hintText,
      ),
    );
  }
}
