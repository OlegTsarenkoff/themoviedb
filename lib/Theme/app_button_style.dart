import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(const Color(0xFF01B4E4)),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
      ),
    ),
  );

  static final ButtonStyle communityButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    foregroundColor: MaterialStateProperty.all(const Color(0xFF235ea7)),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 18.72, fontWeight: FontWeight.bold),
    ),
  );
}
