import 'package:flutter/material.dart';

import '/shared/button_type.dart';

class Button extends StatelessWidget {
  final String label;
  final ButtonType type;

  const Button({
    Key? key,
    required this.label,
    this.type = ButtonType.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('clicou no botao');
      },
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
