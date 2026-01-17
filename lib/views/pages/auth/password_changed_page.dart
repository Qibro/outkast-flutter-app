import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/checkmark_logo.png'),
              SizedBox(height: 24),
              Text(
                'Password Changed!',
                style: AppStyle.titleMainBold(26, AppPallette.gradient1),
              ),
              Text(
                'Your password has been changed successfully.',
                textAlign: TextAlign.center,
                style: AppStyle.textMedium(),
              ),
              SizedBox(height: 72),
              ElevatedButton(
                onPressed: () {
                  Get.offNamedUntil(
                    AppRoute.signIn,
                    (route) => route.settings.name == AppRoute.initial,
                  );
                },
                style: AppStyle.elevatedButtonStyle(),
                child: Text('Back to Sign in', style: AppStyle.textMedium()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
