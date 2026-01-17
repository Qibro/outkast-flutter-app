import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/main/tab_bar_controller.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/views/widgets/reservation_tab.dart';

class ReservationPage extends StatelessWidget {
  ReservationPage({super.key});

  final TabBarController tabx = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservations'),
        bottom: TabBar(
          tabs: tabx.myTabs,
          controller: tabx.tabController,
          labelColor: AppPallette.whiteColor,
          indicatorColor: AppPallette.whiteColor,
        ),
      ),
      body: TabBarView(
        controller: tabx.tabController,
        children: [
          ReservationTab(title: 'Upcoming'),
          ReservationTab(title: 'Completed'),
          ReservationTab(title: 'Cancelled'),
        ],
      ),
    );
  }
}
