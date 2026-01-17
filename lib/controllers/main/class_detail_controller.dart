import 'package:get/get.dart';
import 'package:outkast/controllers/main/home_controller.dart';
import 'package:outkast/core/services/main_api_service.dart';
import 'package:outkast/models/main/classes/class_data.dart';
import 'package:outkast/models/main/reservation/reservation_response.dart';

class ClassDetailController extends GetxController {
  final Rx<ClassData?> classData = Rx<ClassData?>(null);
  final Rx<ReservationResponse?> reservationData = Rx<ReservationResponse?>(
    null,
  );

  Future<void> fetchClassById(String id) async {
    try {
      // Call the API service to get nearby class
      final response = await MainApiService.getClassById(id);
      classData.value = response;
    } catch (e) {
      print('Error fetching class data catch: $e');
    }
  }

  Future<void> reserveClassById({
    required String id,
    void Function()? onSuccess,
    void Function(String e)? onError,
  }) async {
    try {
      // Call the API service to get nearby class
      final response = await MainApiService.reserveClassById(id);
      reservationData.value = response;

      if (response.message == 'Reservation successful.' && onSuccess != null) {
        HomeController homeController = Get.find<HomeController>();
        ClassDetailController classDetailController =
            Get.find<ClassDetailController>();

        homeController.addReservedClass(classData.value!);
        await homeController.fetchNearbyClasses();
        await classDetailController.fetchClassById(id);

        onSuccess();
      }
    } catch (e) {
      print('Error reserving class catch: $e');
      if (onError != null) {
        onError(e.toString());
      }
    }
  }
}
