import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_pallette.dart';

class BadgeSlot extends StatelessWidget {
  const BadgeSlot({super.key, required this.slots});

  final int slots;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppPallette.overlayColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Builder(
        builder: (context) {
          if (slots == 0) {
            return Text(
              textAlign: TextAlign.center,
              'Booked!',
              style: TextStyle(
                color: AppPallette.gradient1,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
          }
          return Text(
            textAlign: TextAlign.center,
            slots > 5 ? 'Slots Available' : '$slots Slots Left',
            style: TextStyle(
              color: AppPallette.greenColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          );
        },
      ),
    );
  }
}
