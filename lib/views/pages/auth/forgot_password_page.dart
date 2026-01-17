import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/auth_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              'Forgot Password?',
              style: AppStyle.titleMainBold(26, AppPallette.gradient1),
            ),
            Text(
              'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              textAlign: TextAlign.start,
              style: AppStyle.textMedium(),
            ),
            SizedBox(height: 32),
            AuthField(titleText: 'Email', hintText: 'name@example.com'),
            SizedBox(height: 8),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.createNewPassword);
              },
              style: AppStyle.elevatedButtonStyle(),
              child: Text(
                'Request Reset Password',
                style: TextStyle(color: AppPallette.whiteColor),
              ),
            ),
            Spacer(),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Remember Password? ",
                        style: AppStyle.textMedium(14),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: AppStyle.titleMainBold(
                          14,
                          AppPallette.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
