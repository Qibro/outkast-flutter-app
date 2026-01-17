import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/views/pages/main/home_page.dart';
import 'package:outkast/views/pages/main/profile_page.dart';
import 'package:outkast/views/pages/main/reservation_page.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs; // Observable integer for the current index

  final List<Widget> pages = [HomePage(), ReservationPage(), ProfilePage()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
