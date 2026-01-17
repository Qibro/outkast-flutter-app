import 'package:outkast/core/services/api_service.dart';
import 'package:outkast/models/main/activities/activties_response.dart';
import 'package:outkast/models/main/classes/class_data.dart';
import 'package:outkast/models/main/classes/classes_response.dart';
import 'package:outkast/models/main/instructors/instructors_response.dart';
import 'package:outkast/models/main/reservation/reservation_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApiService {
  /// Login user
  static Future<ActivtiesResponse> getActivities() async {
    try {
      final response = await ApiService.get('/activities');

      final data = ApiService.handleResponse(response);
      return ActivtiesResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<InstructorsResponse> getInstructors() async {
    try {
      final response = await ApiService.get('/instructors');

      final data = ApiService.handleResponse(response);
      return InstructorsResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ClassesResponse> getNearbyClasses() async {
    try {
      final response = await ApiService.get('/classes/nearby');

      final data = ApiService.handleResponse(response);
      return ClassesResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ClassData> getClassById(String classId) async {
    try {
      final response = await ApiService.get('/classes/$classId');
      final data = ApiService.handleResponse(response);
      return ClassData.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ReservationResponse> reserveClassById(String classId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final response = await ApiService.post(
        '/classes/$classId/reserve',
        headers: {'Authorization': 'Bearer $token'},
      );

      final data = ApiService.handleResponse(response);
      return ReservationResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
