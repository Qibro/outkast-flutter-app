import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/services/main_api_service.dart';
import 'package:outkast/models/main/activities/activity_data.dart';
import 'package:outkast/models/main/classes/class_data.dart';
import 'package:outkast/models/main/instructors/instructors_data.dart';

class HomeController extends GetxController {
  final RxList<ActivityData> activities = <ActivityData>[].obs;
  final RxList<InstructorData> instructors = <InstructorData>[].obs;
  final RxList<ClassData> classes = <ClassData>[].obs;
  final RxList<ClassData> reservedClasses = <ClassData>[].obs;
  final RxList<ClassData> canceledClasses = <ClassData>[].obs;
  final RxList<ClassData> completedClasses = <ClassData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchActivities();
    fetchInstructors();
    fetchNearbyClasses();
  }

  Future<void> fetchActivities() async {
    try {
      // Call the API service to get activities
      final response = await MainApiService.getActivities();
      activities.clear();
      activities.addAll(response.activities);
    } catch (e) {
      print('Error fetching activities: $e');
    }
  }

  Future<void> fetchInstructors() async {
    try {
      // Call the API service to get instructors
      final response = await MainApiService.getInstructors();
      instructors.clear();
      instructors.addAll(response.instructors);
    } catch (e) {
      print('Error fetching instructors: $e');
    }
  }

  Future<void> fetchNearbyClasses() async {
    try {
      // Call the API service to get nearby classes
      final response = await MainApiService.getNearbyClasses();
      classes.clear();
      classes.addAll(response.classes);
    } catch (e) {
      print('Error fetching nearby classes: $e');
      Get.snackbar(
        'Error fetching nearby classes',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
    }
  }

  void addReservedClass(ClassData classData) {
    canceledClasses.removeWhere((c) => c.id == classData.id);
    reservedClasses.add(
      ClassData(
        id: classData.id,
        instructor: classData.instructor,
        activity: classData.activity,
        start: classData.start,
        end: classData.end,
        slots: classData.slots - 1,
        location: classData.location,
      ),
    );
  }

  void addCanceledClass(ClassData classData) {
    reservedClasses.removeWhere((c) => c.id == classData.id);
    canceledClasses.add(classData);
  }
}
