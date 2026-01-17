import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_pallette.dart';

class SettingsItemTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SettingsItemTile({required this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallette.overlayColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppPallette.whiteColor,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
