import 'package:flutter/material.dart';

import '/shared/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;

  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;

  const InputText({
    required this.label,
    required this.hint,
    this.obscure = false,
    this.onChanged,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label).label,
          SizedBox(
            height: size.height * .012,
          ),
          TextFormField(
            style: AppTheme.textStyles.input,
            obscureText: obscure,
            onChanged: onChanged,
            validator: (value) {
              if (value != null) {
                return validator!(value);
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16.0),
              hintText: hint,
              hintStyle: AppTheme.textStyles.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.colors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
