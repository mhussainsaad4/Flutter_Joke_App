import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  const CText(this.text, {this.style, this.textAlign, super.key});

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
