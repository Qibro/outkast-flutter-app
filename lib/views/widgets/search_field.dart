import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_pallette.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const SearchField({super.key, required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: AppPallette.overlayColor,
            prefixIcon: Icon(icon, color: AppPallette.whiteColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppPallette.outlineBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppPallette.outlineBorderColor),
            ),
          ),
        ),
      ],
    );
  }
}
