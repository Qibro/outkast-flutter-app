import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/authentication/auth_controller.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/app_bar_widget.dart';
import 'package:outkast/views/widgets/auth_field.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final AuthController authController = Get.find<AuthController>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    usernameController.text =
        authController.currentUser?.username ?? 'username';
    emailController.text = authController.currentUser?.username ?? 'email';
    passwordController.text =
        authController.currentUser?.password ?? 'password';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(title: 'Profile'),
            AuthField(
              titleText: 'username',
              hintText: 'username',
              isRequired: true,
              controller: usernameController,
            ),
            SizedBox(height: 8),
            AuthField(
              titleText: 'Email',
              hintText: 'name@example.com',
              isRequired: true,
              controller: emailController,
            ),
            SizedBox(height: 8),
            AuthField(
              titleText: 'Password',
              hintText: 'password',
              isRequired: true,
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 4),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: AppStyle.elevatedButtonStyle(),
              child: Text(
                'Save',
                style: TextStyle(color: AppPallette.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
