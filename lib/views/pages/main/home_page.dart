import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/main/home_controller.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/class_card.dart';
import 'package:outkast/views/widgets/activity_grid.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leadingWidth: 130,
        leading: Row(
          children: [
            SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location', style: AppStyle.textMedium(12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tangerang', style: AppStyle.textMedium()),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: AppPallette.whiteColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle settings button press
              Get.toNamed(AppRoute.getSearchActivity());
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_outlined),
            onPressed: () {
              // Handle settings button press
            },
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Activity',
                    style: AppStyle.titleMainBold(
                      22,
                      AppPallette.whiteColor,
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 16),

                  Obx(
                    () => Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var activity in homeController.activities)
                          ActivityGrid(
                            image: 'assets/${activity.icon}',
                            title: activity.name,
                            onTap: () {
                              // Handle activity tap
                            },
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rising Instructors',
                    style: AppStyle.titleMainBold(
                      22,
                      AppPallette.whiteColor,
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'See More',
                          style: AppStyle.textMedium(14, AppPallette.greyColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: AppPallette.greyColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Obx(
              () => SizedBox(
                height: 110,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  shrinkWrap: true,
                  itemCount: homeController.instructors.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: NetworkImage(
                              homeController.instructors[index].photo,
                            ),
                          ),
                          Text(
                            homeController.instructors[index].name,
                            style: AppStyle.textMedium(
                              16,
                              AppPallette.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near you',
                    style: AppStyle.titleMainBold(
                      22,
                      AppPallette.whiteColor,
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'See More',
                          style: AppStyle.textMedium(14, AppPallette.greyColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: AppPallette.greyColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                shrinkWrap: true,
                itemCount: homeController.classes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ClassCard(
                      classData: homeController.classes[index],
                      onPress: () {
                        Get.toNamed(
                          AppRoute.getClassDetail(),
                          arguments: homeController.classes[index].id,
                        );
                        // Handle reservation
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
