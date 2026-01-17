import 'dart:convert';

class InstructorData {
  final int id;
  final String name;
  final String photo;
  InstructorData({required this.id, required this.name, required this.photo});

  InstructorData copyWith({int? id, String? name, String? photo}) {
    return InstructorData(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'photo': photo};
  }

  factory InstructorData.fromMap(Map<String, dynamic> map) {
    return InstructorData(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstructorData.fromJson(String source) =>
      InstructorData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'InstructorData(id: $id, name: $name, photo: $photo)';

  @override
  bool operator ==(covariant InstructorData other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}
