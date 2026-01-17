import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.leading,
    this.leadingWidth,
    this.actions,
  });
  final double? leadingWidth;
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0.0,
      title: title != null
          ? Text(
              title!,
              style: AppStyle.titleMainBoldItalic(22, AppPallette.whiteColor),
            )
          : null,
      elevation: 0,
      leadingWidth: leadingWidth,
      leading:
          leading ??
          IconButton(
            icon: Icon(Icons.arrow_back, color: AppPallette.whiteColor),
            onPressed: () {
              Get.back();
            },
          ),
      actions: actions,
    );
  }
}
