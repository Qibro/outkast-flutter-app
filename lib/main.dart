import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/authentication/auth_controller.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  Get.put(AuthController());
  runApp(MyApp(isLoggedIn: token.isNotEmpty));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      initialRoute: isLoggedIn ? AppRoute.main : AppRoute.initial,
      defaultTransition: Transition.cupertino,
      getPages: AppRoute.pages,
    );
  }
}
