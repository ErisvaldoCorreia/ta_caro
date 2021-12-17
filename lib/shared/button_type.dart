import 'package:flutter/material.dart';

import '/shared/app_theme.dart';

enum ButtonType { fill, outline, none }

TextStyle textStyle(type) {
  switch (type) {
    case ButtonType.fill:
      return AppTheme.textStyles.buttonBackgroundColor;
    case ButtonType.outline:
      return AppTheme.textStyles.buttonBoldTextColor;
    case ButtonType.none:
      return AppTheme.textStyles.buttonTextColor;
    default:
      throw 'Button Type Invalid';
  }
}

BoxDecoration boxDecoration(type) {
  switch (type) {
    case ButtonType.fill:
      return BoxDecoration(
        color: AppTheme.colors.primary,
        borderRadius: BorderRadius.circular(10),
      );
    case ButtonType.outline:
      return BoxDecoration(
        color: AppTheme.colors.background,
        border: Border.fromBorderSide(
          BorderSide(
            color: AppTheme.colors.border,
            width: 3,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      );
    case ButtonType.none:
      return BoxDecoration(
        color: Colors.transparent,
      );
    default:
      throw 'Button Type Invalid';
  }
}
