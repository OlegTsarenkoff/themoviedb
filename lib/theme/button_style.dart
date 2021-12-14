import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(AppColors.linkButtonColor),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
      ),
    ),
  );

  static final ButtonStyle communityButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.backgroundColorApp),
    foregroundColor: MaterialStateProperty.all(AppColors.communityButtonColor),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 18.72, fontWeight: FontWeight.bold),
    ),
  );
}
