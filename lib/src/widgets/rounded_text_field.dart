import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final bool autoFocus;
  const RoundedTextField({
    required this.onChanged,
    this.validator,
    this.hintText = '',
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      autofocus: autoFocus,
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
