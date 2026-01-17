import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/main/home_controller.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/views/widgets/app_bar_widget.dart';
import 'package:outkast/views/widgets/class_card.dart';
import 'package:outkast/views/widgets/search_field.dart';

class SearchActivityPage extends StatefulWidget {
  const SearchActivityPage({super.key});

  @override
  State<SearchActivityPage> createState() => _SearchActivityPageState();
}

class _SearchActivityPageState extends State<SearchActivityPage> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            AppBarWidget(title: 'Search'),
            SizedBox(height: 16),
            SearchField(hintText: 'Location', icon: Icons.location_pin),
            SizedBox(height: 8),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: SearchField(
                    hintText: 'Date',
                    icon: Icons.calendar_month,
                  ),
                ),
                Expanded(
                  child: SearchField(
                    hintText: 'Category',
                    icon: Icons.headset_mic_rounded,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SearchField(hintText: 'Activity Class', icon: Icons.run_circle),
            SizedBox(height: 16),
            Flexible(
              child: Obx(
                () => ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: homeController.classes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ClassCard(
                        classData: homeController.classes[index],
                        date: 'Monday, 2 September 2024',
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
            ),
          ],
        ),
      ),
    );
  }
}
