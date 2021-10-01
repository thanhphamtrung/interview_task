import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onPressed;
  const RoundedButton({
    required this.height,
    required this.width,
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
    required this.onPressed,
    this.borderColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text, style: textStyle),
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    side: BorderSide(color: borderColor)))),
        onPressed: onPressed);
  }
}
