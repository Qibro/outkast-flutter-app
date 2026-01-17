class ReservationResponse {
  final String? message;
  final String? token;

  ReservationResponse({this.message, this.token});

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(message: json['message'], token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'token': token};
  }
}
