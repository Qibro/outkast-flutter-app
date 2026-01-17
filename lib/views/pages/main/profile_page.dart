import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/authentication/auth_controller.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/app_bar_widget.dart';
import 'package:outkast/views/widgets/settings_item_tile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController authController = Get.find<AuthController>();

  final List<Map<String, dynamic>> profileMenuItems = const [
    {'title': 'Profile Setting', 'onTap': _handleProfileSetting},
    {'title': 'Location', 'onTap': _handleLocation},
    {'title': 'Notification', 'onTap': _handleNotification},
    {'title': 'Privacy Policy', 'onTap': _handlePrivacyPolicy},
    {'title': 'About', 'onTap': _handleAbout},
  ];

  static void _handleProfileSetting() {
    Get.toNamed(AppRoute.profileSetting);
  }

  static void _handleLocation() {
    // Handle Location tap
  }

  static void _handleNotification() {
    // Handle Notification tap
  }

  static void _handlePrivacyPolicy() {
    // Handle Privacy Policy tap
  }

  static void _handleAbout() {
    // Handle About tap
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Scaffold(
        body: Column(
          children: [
            AppBarWidget(title: 'Profile', leading: SizedBox()),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemCount: profileMenuItems.length,
                itemBuilder: (context, index) {
                  final item = profileMenuItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SettingsItemTile(
                      title: item['title'],
                      onTap: item['onTap'],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                authController.logout();
                Get.offNamedUntil(AppRoute.initial, (route) => false);
              },
              style: AppStyle.elevatedButtonStyle().copyWith(
                backgroundColor: WidgetStateProperty.all(
                  AppPallette.whiteOverlayColor,
                ),
              ),
              child: Text(
                'Log out',
                style: AppStyle.titleMainBold(16, AppPallette.gradient1),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
