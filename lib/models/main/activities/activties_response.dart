import 'package:outkast/models/main/activities/activity_data.dart';

class ActivtiesResponse {
  final List<ActivityData> activities;

  ActivtiesResponse({this.activities = const []});
  factory ActivtiesResponse.fromJson(List<dynamic> json) {
    return ActivtiesResponse(
      activities: List<ActivityData>.from(
        json.map((x) => ActivityData.fromMap(x)),
      ),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return activities.map((x) => x.toMap()).toList();
  }
}
