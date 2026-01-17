import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/services/api_service.dart';
import 'package:outkast/core/services/auth_api_service.dart';
import 'package:outkast/models/auth/login/login_request.dart';
import 'package:outkast/models/auth/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable states
  final _isLoading = false.obs;
  final _isLoggedIn = false.obs;
  final Rxn<UserData> _currentUser = Rxn<UserData>();
  final RxString _token = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;
  UserData? get currentUser => _currentUser.value;
  String get token => _token.value;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  /// Login method
  Future<void> login() async {
    // Validation
    if (emailController.text.trim().isEmpty) {
      _showSnackBar('Error', 'Please enter your email', true);
      return;
    }

    if (passwordController.text.isEmpty) {
      _showSnackBar('Error', 'Please enter your password', true);
      return;
    }

    try {
      _isLoading.value = true;

      final request = LoginRequest(
        username: emailController.text.trim(),
        password: passwordController.text,
      );

      final response = await AuthApiService.login(request);
      if (response.token != null && response.token!.isNotEmpty) {
        // Save user data and token
        _currentUser.value = UserData(
          username: emailController.text.trim(),
          password: passwordController.text,
        );
        await SharedPreferences.getInstance().then((prefs) {
          prefs.setString('token', response.token ?? '');
        });
        _token.value = response.token ?? '';
        _isLoggedIn.value = true;

        // Show success message
        Get.offAllNamed(AppRoute.main);

        // Clear form
        emailController.clear();
        passwordController.clear();
      } else {
        _showSnackBar(
          'Login Failed',
          response.message ?? 'Invalid credentials',
          true,
        );
      }
    } on ApiException catch (e) {
      _showSnackBar('Error signing in', e.message, true);
    } catch (e) {
      _showSnackBar('Error signing in', e.toString(), true);
    } finally {
      _isLoading.value = false;
    }
  }

  /// Logout method
  Future<void> logout() async {
    try {
      await AuthApiService.logout();

      // Clear data
      _currentUser.value = null;
      _token.value = '';
      _isLoggedIn.value = false;
      emailController.clear();
      passwordController.clear();

      _showSnackBar('Success', 'Logged out successfully', false);
    } catch (e) {
      _showSnackBar('Error', 'Failed to logout', true);
    }
  }

  void _showSnackBar(String title, String message, bool isError) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: isError
          ? Colors.red.withOpacity(0.8)
          : Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }
}
