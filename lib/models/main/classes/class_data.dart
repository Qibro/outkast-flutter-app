class ClassData {
  final int id;
  final String activity;
  final String location;
  final String instructor;
  final String start;
  final String end;
  final int slots;
  ClassData({
    required this.id,
    required this.activity,
    required this.location,
    required this.instructor,
    required this.start,
    required this.end,
    required this.slots,
  });

  ClassData copyWith({
    int? id,
    String? activity,
    String? location,
    String? instructor,
    String? start,
    String? end,
    int? slots,
  }) {
    return ClassData(
      id: id ?? this.id,
      activity: activity ?? this.activity,
      location: location ?? this.location,
      instructor: instructor ?? this.instructor,
      start: start ?? this.start,
      end: end ?? this.end,
      slots: slots ?? this.slots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'activity': activity,
      'location': location,
      'instructor': instructor,
      'start': start,
      'end': end,
      'slots': slots,
    };
  }

  factory ClassData.fromMap(Map<String, dynamic> map) {
    return ClassData(
      id: map['id'].toInt() as int,
      activity: map['activity'] as String,
      location: map['location'] as String,
      instructor: map['instructor'] as String,
      start: map['start'] as String,
      end: map['end'] as String,
      slots: map['slots'].toInt() as int,
    );
  }

  factory ClassData.fromJson(Map<String, dynamic> json) {
    return ClassData(
      id: json['id'],
      activity: json['activity'],
      location: json['location'],
      instructor: json['instructor'],
      start: json['start'],
      end: json['end'],
      slots: json['slots'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'activity': activity,
      'location': location,
      'instructor': instructor,
      'start': start,
      'end': end,
      'slots': slots,
    };
  }
}
