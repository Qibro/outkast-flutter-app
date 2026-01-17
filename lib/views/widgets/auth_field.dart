import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_theme.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final String titleText;
  final bool isRequired;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  const AuthField({
    super.key,
    required this.titleText,
    required this.hintText,
    this.isRequired = false,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: titleText,
            style: AppStyle.textMedium(14),
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: AppStyle.textMedium(14, Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(hintText: hintText),
          style: AppStyle.textMedium(16, Colors.black),
        ),
      ],
    );
  }
}
