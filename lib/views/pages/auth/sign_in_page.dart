import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/authentication/auth_controller.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/auth_field.dart';

class SignInPage extends GetView<AuthController> {
  const SignInPage({super.key});

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
              'Welcome Back',
              style: AppStyle.titleMainBold(26, AppPallette.gradient1),
            ),
            Text(
              'Sign in to start booking a class',
              textAlign: TextAlign.start,
              style: AppStyle.textMedium(),
            ),
            const SizedBox(height: 32),
            AuthField(
              titleText: 'Email',
              hintText: 'name@example.com',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            AuthField(
              titleText: 'Password',
              hintText: 'password',
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.forgotPassword);
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Forget Password?',
                  textAlign: TextAlign.end,
                  style: AppStyle.textMedium(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading
                    ? null
                    : () => controller.login(),
                style: AppStyle.elevatedButtonStyle(),
                child: controller.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Sign In',
                        style: TextStyle(color: AppPallette.whiteColor),
                      ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(child: Divider(thickness: 1, height: 0.5)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('or', style: AppStyle.textMedium(14)),
                ),
                const Expanded(child: Divider(thickness: 1, height: 0.5)),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: AppStyle.elevatedButtonStyle(false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/google_logo.png', height: 24, width: 24),
                  const SizedBox(width: 12),
                  Text(
                    'Sign In with Google',
                    style: AppStyle.textMedium(16, AppPallette.blackColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.createAccount);
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: AppStyle.textMedium(14),
                      ),
                      TextSpan(
                        text: 'Create Account Now',
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
