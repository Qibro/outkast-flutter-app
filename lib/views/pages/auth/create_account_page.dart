import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/authentication/register_controller.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/auth_field.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to Outkast', style: AppStyle.titleMainBold(26)),
            Text(
              'Let’s create your account',
              textAlign: TextAlign.start,
              style: AppStyle.textMedium(),
            ),
            SizedBox(height: 32),
            AuthField(
              titleText: 'Username',
              hintText: 'username',
              controller: registerController.usernameController,
            ),
            SizedBox(height: 8),
            AuthField(
              titleText: 'Email',
              hintText: 'name@example.com',
              controller: registerController.emailController,
            ),
            SizedBox(height: 8),
            AuthField(
              titleText: 'Password',
              hintText: 'password',
              obscureText: true,
              controller: registerController.passwordController,
            ),
            SizedBox(height: 8),
            AuthField(
              titleText: 'Confirm Password',
              hintText: 'confirm password',
              obscureText: true,
              controller: registerController.confirmPasswordController,
            ),
            SizedBox(height: 30),
            Obx(
              () => ElevatedButton(
                onPressed: registerController.isLoading
                    ? null
                    : () => registerController.register(),
                style: AppStyle.elevatedButtonStyle(),
                child: registerController.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Create Account',
                        style: TextStyle(color: AppPallette.whiteColor),
                      ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, height: 0.5)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('or', style: AppStyle.textMedium(14)),
                ),
                Expanded(child: Divider(thickness: 1, height: 0.5)),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: AppStyle.elevatedButtonStyle(false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/google_logo.png', height: 24, width: 24),
                  SizedBox(width: 12),
                  Text(
                    'Create Account with Google',
                    style: AppStyle.textMedium(16, AppPallette.blackColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: AppStyle.textMedium(14),
                      ),
                      TextSpan(
                        text: 'Sign In Now',
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
