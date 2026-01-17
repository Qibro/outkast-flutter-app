import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';

class ActivityGrid extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const ActivityGrid({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    this.width = 165,
    this.height = 165,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.1, 0.6, 1.0],
            colors: [
              Color.fromARGB(255, 27, 42, 48), // deep blue-teal
              Color.fromARGB(255, 32, 43, 46), // neutral dark center
              Color.fromARGB(255, 58, 43, 38), // soft brown transition
              Color.fromARGB(255, 90, 58, 44), // warm bottom-center glow
            ],
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppPallette.outlineBorderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Image.asset(image),
              Spacer(),
              // Title
              Text(
                title,
                style: AppStyle.textSemiBold(22, AppPallette.whiteColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
