import 'package:outkast/models/main/classes/class_data.dart';

class ClassesResponse {
  final List<ClassData> classes;

  ClassesResponse({this.classes = const []});
  factory ClassesResponse.fromJson(List<dynamic> json) {
    return ClassesResponse(
      classes: List<ClassData>.from(json.map((x) => ClassData.fromMap(x))),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return classes.map((x) => x.toMap()).toList();
  }
}
