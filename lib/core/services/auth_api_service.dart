import 'package:outkast/core/services/api_service.dart';
import 'package:outkast/models/auth/login/login_request.dart';
import 'package:outkast/models/auth/login/login_response.dart';
import 'package:outkast/models/auth/register/register_request.dart';
import 'package:outkast/models/auth/register/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApiService {
  static Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await ApiService.post('/login', body: request.toJson());

      final data = ApiService.handleResponse(response);
      return LoginResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await ApiService.post(
        '/register',
        body: request.toJson(),
      );

      final data = ApiService.handleResponse(response);
      return RegisterResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    try {
      // Clear local data, tokens, etc.
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
    } catch (e) {
      rethrow;
    }
  }
}
