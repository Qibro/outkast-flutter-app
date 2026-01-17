import 'package:outkast/models/main/instructors/instructors_data.dart';

class InstructorsResponse {
  final List<InstructorData> instructors;

  InstructorsResponse({this.instructors = const []});
  factory InstructorsResponse.fromJson(List<dynamic> json) {
    return InstructorsResponse(
      instructors: List<InstructorData>.from(
        json.map((x) => InstructorData.fromMap(x)),
      ),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return instructors.map((x) => x.toMap()).toList();
  }
}
