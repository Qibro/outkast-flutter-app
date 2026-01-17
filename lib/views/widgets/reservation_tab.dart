import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/main/home_controller.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/models/main/classes/class_data.dart';
import 'package:outkast/views/widgets/class_card.dart';

class ReservationTab extends StatelessWidget {
  ReservationTab({super.key, required this.title});
  final String title;
  final HomeController homeController = Get.find<HomeController>();

  List<ClassData> get classesToShow {
    if (title == 'Upcoming') {
      return homeController.reservedClasses;
    } else if (title == 'Cancelled') {
      return homeController.canceledClasses;
    } else {
      return homeController.completedClasses;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (classesToShow.isEmpty) {
        return Center(
          child: Text('No $title Classes', style: AppStyle.textMedium(16)),
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: classesToShow.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ClassCard(
              classData: classesToShow[index],
              isCancelable: title == 'Upcoming',
              onPress: () {
                if (title == 'Upcoming') {
                  homeController.addCanceledClass(classesToShow[index]);
                }
                if (title == 'Cancelled') {
                  // Handle re-reserve action if needed
                  Get.toNamed(
                    AppRoute.getClassDetail(),
                    arguments: classesToShow[index].id,
                  );
                }
              },
            ),
          );
        },
      );
    });
  }
}
