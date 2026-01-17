import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/auth_field.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Password',
              style: AppStyle.titleMainBold(26, AppPallette.gradient1),
            ),
            Text(
              'Your new password must be unique from those previously used.',
              textAlign: TextAlign.start,
              style: AppStyle.textMedium(),
            ),
            SizedBox(height: 32),
            AuthField(titleText: 'New Password', hintText: 'new password'),
            SizedBox(height: 8),
            AuthField(
              titleText: 'Confirm Password',
              hintText: 'confirm password',
            ),
            SizedBox(height: 8),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.passwordChanged);
              },
              style: AppStyle.elevatedButtonStyle(),
              child: Text(
                'Reset Password',
                style: TextStyle(color: AppPallette.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
