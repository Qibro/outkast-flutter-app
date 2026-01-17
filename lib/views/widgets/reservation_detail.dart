import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/models/main/classes/class_data.dart';
import 'package:outkast/views/widgets/bottom_sheet_container.dart';

class ReservationBottomSheet extends StatelessWidget {
  final ClassData classData;
  final VoidCallback onConfirm;

  const ReservationBottomSheet({
    super.key,
    required this.classData,
    required this.onConfirm,
  });

  static Future<void> show({
    required BuildContext context,
    required ClassData classData,
    required VoidCallback onConfirm,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) =>
          ReservationBottomSheet(classData: classData, onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            'Reservation',
            style: AppStyle.titleMainBold(20, AppPallette.whiteColor),
          ),
          const SizedBox(height: 24),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Activity Name
                Text(
                  classData.activity,
                  style: AppStyle.titleMainBold(18, AppPallette.whiteColor),
                ),
                const SizedBox(height: 8),
                // Date
                Text(
                  'Date: ${classData.start}',
                  style: AppStyle.textMedium(
                    14,
                    AppPallette.whiteColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 4),
                // Time
                Text(
                  '${classData.start} - ${classData.end}',
                  style: AppStyle.textMedium(
                    14,
                    AppPallette.whiteColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 16),
                // Location
                Text(
                  classData.location,
                  style: AppStyle.textMedium(14, AppPallette.whiteColor),
                ),
                const SizedBox(height: 12),
                // Instructor
                Row(
                  children: [
                    Icon(Icons.person, color: AppPallette.whiteColor, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      classData.instructor,
                      style: AppStyle.textMedium(14, AppPallette.whiteColor),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Confirmation Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: AppStyle.elevatedButtonStyle(),
                    child: Text(
                      'Confirmation Reservation',
                      style: AppStyle.textSemiBold(16, AppPallette.whiteColor),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Cancel Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: AppStyle.elevatedButtonStyle(false),
                    child: Text(
                      'Cancel',
                      style: AppStyle.textSemiBold(16, AppPallette.blackColor),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Disclaimer Text
                Text(
                  'Some classes may have specific membership requirements. Please check the class description for details.',
                  textAlign: TextAlign.center,
                  style: AppStyle.textMedium(14, AppPallette.greyColor),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
