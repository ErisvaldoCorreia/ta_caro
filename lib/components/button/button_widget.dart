import 'package:flutter/material.dart';

import 'button_type.dart';

class Button extends StatelessWidget {
  final String label;
  final ButtonType type;
  final VoidCallback onPress;

  const Button({
    Key? key,
    required this.label,
    required this.onPress,
    this.type = ButtonType.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPress,
      child: Container(
        height: size.height * .058,
        width: double.maxFinite,
        decoration: boxDecoration(type),
        child: Center(
          child: Text(
            label,
            style: textStyle(type),
          ),
        ),
      ),
    );
  }
}
