import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/services/api_service.dart';
import 'package:outkast/core/services/auth_api_service.dart';
import 'package:outkast/models/auth/register/register_request.dart';

class RegisterController extends GetxController {
  // Text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable states
  final _isLoading = false.obs;
  final _isLoggedIn = false.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    // Validation
    if (emailController.text.trim().isEmpty) {
      _showSnackBar('Error', 'Please enter your email', true);
      return;
    }

    if (usernameController.text.trim().isEmpty) {
      _showSnackBar('Error', 'Please enter your username', true);
      return;
    }

    if (passwordController.text.isEmpty) {
      _showSnackBar('Error', 'Please enter your password', true);
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      _showSnackBar('Error', 'Please enter your confirm password', true);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showSnackBar("Error", "Passwords do not match", true);
      return;
    }

    try {
      _isLoading.value = true;

      final request = RegisterRequest(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      final response = await AuthApiService.register(request);
      if (response.message != null &&
          response.message == 'User registered successfully.') {
        // Show success messages
        Get.back();

        // Clear form
        emailController.clear();
        usernameController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        _showSnackBar(
          response.message ?? 'Registration successful',
          'You can now log in with your credentials.',
          false,
        );
      } else {
        _showSnackBar(
          'Registration Failed',
          response.message ?? 'Registration unsuccessful',
          true,
        );
      }
    } on ApiException catch (e) {
      _showSnackBar('Error', e.message, true);
    } catch (e) {
      _showSnackBar(
        'Error',
        'An unexpected error occurred. Please try again.',
        true,
      );
    } finally {
      _isLoading.value = false;
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
