import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/models/main/classes/class_data.dart';
import 'package:outkast/views/widgets/badge_slot.dart';

class ClassCard extends StatelessWidget {
  final ClassData classData;
  final VoidCallback? onPress;
  final bool isCancelable;
  final String? date;

  const ClassCard({
    super.key,
    required this.classData,
    this.isCancelable = false,
    this.onPress,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (date != null)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Text(
                  date!,
                  style: AppStyle.titleMainBold(
                    18,
                    AppPallette.whiteColor,
                  ).copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppPallette.overlayColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppPallette.overlayColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${classData.start} - ${classData.end}',
                      style: AppStyle.textMedium(14, AppPallette.whiteColor),
                    ),
                    const SizedBox(height: 4),
                    // Activity Name
                    Text(
                      classData.activity,
                      style: AppStyle.titleMainBold(18, AppPallette.whiteColor),
                    ),
                    const SizedBox(height: 16),
                    // Location
                    Text(
                      classData.location,
                      style: AppStyle.textMedium(14, AppPallette.whiteColor),
                    ),
                    const SizedBox(height: 14),
                    // Instructor with Icon
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: AppPallette.whiteColor,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          classData.instructor,
                          style: AppStyle.textMedium(
                            14,
                            AppPallette.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  spacing: 50,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BadgeSlot(slots: classData.slots),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: classData.slots > 0 || isCancelable
                            ? onPress
                            : null,
                        style: AppStyle.elevatedButtonStyle(!isCancelable)
                            .copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                        child: Text(
                          isCancelable ? 'Cancel' : 'Reserve',
                          style: AppStyle.textMedium(
                            16,
                            isCancelable
                                ? AppPallette.blackColor
                                : AppPallette.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
