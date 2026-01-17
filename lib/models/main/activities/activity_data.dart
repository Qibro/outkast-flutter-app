import 'dart:convert';

class ActivityData {
  final int id;
  final String name;
  final String icon;
  ActivityData({required this.id, required this.name, required this.icon});

  ActivityData copyWith({int? id, String? name, String? icon}) {
    return ActivityData(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'icon': icon};
  }

  factory ActivityData.fromMap(Map<String, dynamic> map) {
    return ActivityData(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityData.fromJson(String source) =>
      ActivityData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ActivityData(id: $id, name: $name, icon: $icon)';

  @override
  bool operator ==(covariant ActivityData other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ icon.hashCode;
}
